require_relative "static_array"

class RingBuffer
  attr_reader :length, :start, :length

  def initialize(length = 8)
    @length = 0
    @store = Hash.new(length)
    @capacity = 8
    @start = 0
  end

  # O(1)
  def [](index)
    if (0...@length).include?(index)
      @store[check_index(index)]
    else
      raise 'index out of bounds'
    end
  end

  # O(1)
  def []=(index, val)
    if (0...@length).include?(index)
      @store[index % @capacity] = val
    else
      raise 'index out of bounds'
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length < 1
    @length -= 1
    return @store[check_index(@length)]
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[@start + @length] = val
    @length += 1
    return @store
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length < 1
    shifted = @store[@start % @capacity]
    @start += 1
    @length -= 1
    return shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start -= 1
    @length += 1
    @store[check_index(0)] = val
  end

  protected
  # attr_accessor :capacity, :start, :store
  attr_writer :length

  def check_index(index)
    (@start + index) % @capacity
  end

  def resize!
    new_hash = Hash.new(@capacity * 2)
    @capacity.times do |i|
      new_hash[i] = @store[check_index(i)]
    end
    @start = 0
    @store = new_hash
    @capacity *= 2
  end
end

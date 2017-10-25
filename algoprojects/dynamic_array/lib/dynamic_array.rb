require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @store = Hash.new(4)
    @capacity = 8
  end

  # O(1)
  def [](index)
    if (0...@length).include?(index)
      @store[index]
    else
      raise 'index out of bounds'
    end
  end

  # O(1)
  def []=(index, value)
    if (0...@length).include?(index)
      @store[index] = value
    else
      raise 'index out of bounds'
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length < 1
    popped = @store[@length-1]
    @store[@length-1] = nil
    @length -= 1
    return popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
    return @store
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length < 1
    shifted = @store[0]
    @length -= 1
    i = 1
    new_array = Hash.new(@length)
    while i <= @length
      new_array[i-1] = @store[i]
      i += 1
    end
    @store = new_array
    return shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    new_array = Hash.new(@length)
    @length += 1
    @store.each do |k, v|
      new_array[k+1] = v
    end
    new_array[0] = val
    @store = new_array
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @store = @store.merge(Hash.new(@capacity * 2))
    @capacity *= 2
  end
end

# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
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

  protected
  attr_accessor :store
end

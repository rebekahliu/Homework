require_relative "heap"

class Array

  def heap_sort!
    before_array = self.dup
    heaped = false
    until heaped == true
      i = 0
      until i > self.length
        BinaryMinHeap.heapify_down(self, i, len = self.length)
        i += 1
      end
      heaped = true if self == before_array
      before_array = self
    end

    partition = self.length - 1
    i = 0
    while i < self.length
      first = self.shift
      self << first
      BinaryMinHeap.heapify_down(self, 0, partition)
      i += 1
      partition -= 1
    end
    #
    return self
  end

end

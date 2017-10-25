require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def sort1(array)
    return array if array.length <= 1

    pivot = array.shift
    left = []
    right = []

    array.each do |el|
      el <= pivot ? left << el : right << el
    end

    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    pivot_idx = QuickSort.partition(array, 0, array.length)
    p ("pivot_idx: #{pivot_idx}")
    return array if length <= 1

    # debugger
    pivot = array[pivot_idx]
    # p ("pivot: #{pivot}")
    left = QuickSort.sort2!(array, 0, pivot_idx)
    p ("left: #{left}")
    # debugger
    p array.find_index(pivot)
    # right = QuickSort.sort2!(array, pivot_idx + 1)
    p ("right: #{right}")
    # array = QuickSort.partition(right, 0, right.length) + [pivot] + QuickSort.partition(left, pivot_idx + 1, left.length)
    p ("array: #{array}")
    return (left + [pivot] + right).compact
  end

  def self.partition(array, start, length, &prc)
    p 'partition'
    p ("array: #{array}")
    p ("start: #{start}")
    p ("length: #{length}")
    bound = start
    pivot = array[start]
    i = 1
    while (bound + i) < array.length
      if array[bound + i] <= pivot
        array[bound + i], array[bound + 1] = array[bound + 1], array[bound + i]
        bound += 1
      else
        i += 1
      end
    end
    array[start], array[bound] = array[bound], array[start]
    return bound
  end
end

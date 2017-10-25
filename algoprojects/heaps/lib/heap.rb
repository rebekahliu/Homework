require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
    @store.length - 1
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    last = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, len = @store.length, &prc)
    return last
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count, len = @store.length, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    result = []
    # debugger
    child1_idx = 2 * parent_index + 1
    child2_idx = 2 * parent_index + 2
    if child1_idx < len
      result << child1_idx
      if child2_idx < len
        result << child2_idx
      end
    end
    return result
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    result = (child_index - 1) / 2
  end

  def self.smallest_child_index(array, child1_idx, child2_idx)
    array[child1_idx] > array[child2_idx] ? child2_idx : child1_idx
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    # debugger
    children_indices = self.child_indices(len, parent_idx)
    if children_indices.length == 2
      smallest_child_idx = self.smallest_child_index(array, children_indices[0], children_indices[1])
    elsif children_indices.length == 1
      smallest_child_idx = children_indices[0]
    else
      return array
    end

    until array[parent_idx] <= array[smallest_child_idx]
      array[parent_idx], array[smallest_child_idx] = array[smallest_child_idx], array[parent_idx]
      parent_idx = smallest_child_idx
      begin
        children_indices = self.child_indices(len, parent_idx)
        smallest_child_idx = self.smallest_child_index(array, children_indices[0], children_indices[1])
      rescue
      end
    end
    
    return array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    parent_idx = self.parent_index(child_idx)
    until array[child_idx] >= array[parent_idx]
      return array if child_idx == 0
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      child_idx = parent_idx
      begin
        parent_idx = self.parent_index(child_idx)
      rescue
      end
    end
    return array
  end

end

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      return pair.last if pair.first == key
    end
    false
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if pair.first == key
    end
  end

  def show
    @map
  end
end

if __FILE__ == $PROGRAM_NAME
  p new_map = Map.new
  p new_map.assign("hi", "hello")
  p new_map.assign("tea", "biscuit")
  p new_map.assign("mountain", "sea")
  p new_map.lookup("hi")
  p new_map.remove("hi")
  p new_map.lookup("hi")
  p new_map.show

end

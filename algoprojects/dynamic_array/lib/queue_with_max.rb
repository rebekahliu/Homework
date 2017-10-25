# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new(8)
    @start = @store.start
    @max = []
  end

  def enqueue(val)
    @store.push(val)
    check_max(val)
  end

  def dequeue
    dequeued = @store.shift
    if dequeued == @max[0]
      @max = @max[1..-1]
    end
    return dequeued
  end

  def max
    @max[0]
  end

  def length
    @store.length
  end

  private

  def check_max(val)
    if @max == [] || val > @max[0]
      @max = [val]
    else
      (@max.length - 1).downto(0) do |i|
        if val <= @max[i]
          @max = @max[0..i] + [val]
        end
      end
    end
  end

end

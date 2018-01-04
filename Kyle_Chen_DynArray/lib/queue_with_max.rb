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
    @maxqueue = RingBuffer.new
    @store = RingBuffer.new
  end

  def enqueue(val)
    add_to_queue(val)
    @store.push(val)
  end

  def add_to_queue(val)
    while @maxqueue.length > 0 && @maxqueue[@maxqueue.length - 1] < val
      @maxqueue.pop
    end
    @maxqueue.push(val)
  end

  def dequeue
    val = @store.shift
    @maxqueue.shift if val == @maxqueue[0]
    val
  end

  def max
    @maxqueue[0] unless @maxqueue.length == 0
  end

  def length
    @store.length
  end

end

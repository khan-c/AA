require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0;
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    # p index
    # p @length
    raise 'index out of bounds' if index >= @length
    @store[(index + @start_idx) % @capacity]
  end

  # O(1)
  def []=(index, val)
    raise 'index out of bounds' if index >= @length
    @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    @length -= 1
    @store[@length + @start_idx]
  end

  # O(1) ammortized
  def push(val)
    check_index(@length + 1)
    @length += 1
    @store[@length + @start_idx - 1] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if @length == 0
    val = @store[@start_idx]
    @length -= 1
    @start_idx += 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    check_index(@length + 1)
    @length += 1
    @start_idx -= 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    resize! if index > @capacity
  end

  def resize!
    dup_store = @store
    dup_start = @start_idx
    @store = StaticArray.new(@capacity * 2)
    @length = 0
    @start_idx = 0
    (dup_start...dup_start + @capacity).each do |idx|
      self.push(dup_store[idx])
    end
    @capacity *= 2
  end
end

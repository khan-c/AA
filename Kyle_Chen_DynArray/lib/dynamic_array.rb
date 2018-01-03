require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise 'index out of bounds' if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    @length -= 1
    @store[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    check_index(@length + 1)
    @length += 1
    self[@length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length == 0
    val = self[0]
    (@length - 1).times do |idx|
      self[idx] = self[idx + 1]
    end
    @length -= 1
    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    check_index(@length + 1)
    @length += 1
    (@length - 1).downto(0) do |idx|
      self[idx] = self[idx - 1]
    end
    self[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    resize! if index > @capacity
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    dup_store = @store
    @store = StaticArray.new(@capacity * 2)
    @length = 0
    @capacity.times do |idx|
      self.push(dup_store[idx])
    end
    @capacity *= 2
  end
end

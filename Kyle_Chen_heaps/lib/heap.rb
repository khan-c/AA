class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |a, b| a <=> b }
    @store = Array.new
  end

  def count
    @store.length
  end

  def extract
    raise 'no element to extract' if count == 0

    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &@prc)
    
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    # children = []
    # child1, child2 = 2 * parent_index + 1, 2 * parent_index + 2
    # children.push(child1) if child1 < len
    # children.push(child2) if child2 < len
    # children

    [2 * parent_index + 1, 2 * parent_index + 2].select do |el|
      el < len
    end
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    children = BinaryMinHeap.child_indices(len, parent_idx)

    if children.empty?
      return array
    elsif children.length == 1
      smaller_child_idx = children[0]
    else
      smaller_child_idx = prc.call(array[children[0]], array[children[1]]) < 0 ? children[0] : children[1]
    end

    if prc.call(array[parent_idx], array[smaller_child_idx]) > 0
      array[parent_idx], array[smaller_child_idx] = array[smaller_child_idx], array[parent_idx]
      BinaryMinHeap.heapify_down(array, smaller_child_idx, len, &prc)
    end

    return array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if child_idx == 0

    parent_idx = BinaryMinHeap.parent_index(child_idx)

    if prc.call(array[child_idx], array[parent_idx]) < 0
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    end

    return array
  end
end

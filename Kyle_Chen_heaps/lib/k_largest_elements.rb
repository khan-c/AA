require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new
  k.times do
    heap.push(array.pop)
  end
  until array.empty?
    heap.push(array.pop)
    heap.extract
  end

  heap.store


  # prc = Proc.new { |a, b| -1 * (a <=> b) }
  # (0...array.length).each do |idx|
  #   BinaryMinHeap.heapify_up(array, idx, &prc)
  # end
  #
  # (array.length - 1).downto(array.length - k) do |idx|
  #   array[0], array[idx] = array[idx], array[0]
  #   BinaryMinHeap.heapify_down(array, 0, idx, &prc)
  # end
  #
  # array.drop(array.length - k)
end

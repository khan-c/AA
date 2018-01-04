require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |a, b| -1 * (a <=> b) }

    (0...self.length).each do |idx|
      BinaryMinHeap.heapify_up(self, idx, &prc)
    end

    (self.length - 1).downto(1) do |idx|
      self[0], self[idx] = self[idx], self[0]
      BinaryMinHeap.heapify_down(self, 0, idx, &prc)
    end

    self
  end
end

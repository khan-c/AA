class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    new_pivot = rand(array.length)

    left = array.select { |el| el < new_pivot }
    middle = array.select { |el| new_pivot == el}
    right = array.select { |el| el >= new_pivot }

    return sort1(left) + middle + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1 || start > array.length

    prc ||= Proc.new { |a, b| a <=> b }

    pivot_idx = partition(array, start, length, &prc)

    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    pivot = array[start]
    partition = start
    i = start + 1

    while i < length + start
      if prc.call(array[i], pivot) < 0
        partition += 1
        array[i], array[partition] = array[partition], array[i]
      end

      i += 1
    end

    array[partition], array[start] = array[start], array[partition]
    partition
  end
end

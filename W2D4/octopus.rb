fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
  "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7
}

# O(n^2)
def sluggish_octopus(fish)
  found_fish = false

  until found_fish
    found_fish = true
    (fish.length - 1).times do |idx|
      if fish[idx].length > fish[idx + 1].length
        fish[idx], fish[idx + 1] = fish[idx + 1], fish[idx]
        found_fish = false
      end
    end
  end

  fish.last
end

# O(n log n)
def dominant_octopus(fish)
  merge_sort(fish).last
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  sorted_left = merge_sort(arr.take(mid))
  sorted_right = merge_sort(arr.drop(mid))

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end

# O(n)
def clever_octopus(fish)
  longest = ""
  fish.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end

  longest
end

# O(n)
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

# O(1)
def constant_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end

p sluggish_octopus(fish)
p dominant_octopus(fish)
p clever_octopus(fish)
p slow_dance("up", tiles_array)
p constant_dance("right", new_tiles_data_structure)

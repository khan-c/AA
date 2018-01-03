require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new
  string.chars.each do |char|
    map[char] = map.include?(char) ? map[char] + 1 : 1
  end

  num_odd = 0

  map.each do |_, val|
    num_odd += 1 if val.odd?
  end

  num_odd < 2
end

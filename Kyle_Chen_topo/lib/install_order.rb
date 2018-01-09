# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require 'graph'
require 'topological_sort'


def install_order(arr)
  v_hash = {}
  max = nil

  arr.each do |tuple|
    max = tuple[0] if max.nil? || tuple[0] > max
    max = tuple[1] if tuple[1] > max

    v_hash[tuple[0]] = Vertex.new(tuple[0]) unless v_hash[tuple[0]]
    v_hash[tuple[1]] = Vertex.new(tuple[1]) unless v_hash[tuple[1]]
    Edge.new(v_hash[tuple[1]], v_hash[tuple[0]])
  end

  (1..max).each do |i|
    v_hash[i] = Vertex.new(i) unless v_hash[i]
  end

  topological_sort(v_hash.values).map(&:value)
end

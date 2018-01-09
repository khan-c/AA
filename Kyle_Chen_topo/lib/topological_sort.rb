require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's
# def topological_sort(vertices)
#   results = []
#   top = []
#   vertices.each do |vertex|
#     top.push(vertex) if vertex.in_edges.empty?
#   end
#
#   until top.empty?
#     current_vertex = top.shift
#     results << current_vertex
#
#     until current_vertex.out_edges.empty?
#       edge = current_vertex.out_edges[0]
#       dest = edge.to_vertex
#       edge.destroy!
#       top.push(dest) if dest.in_edges.empty?
#     end
#
#     vertices.delete(current_vertex)
#   end
#
#   top.empty? && vertices.empty? ? results : []
# end

# Tarjan's
def topological_sort(vertices)
  results = []
  while vertices.any? { |vert| vert.mark == 'none' }
    begin
      v = vertices.find { |vert| vert.mark == 'none' }
      visit(v, results)
    rescue StandardError
      []
    end
  end

  results
end


def visit(node, arr)
  return if node.mark == 'permanent'
  raise 'cyclic' if node.mark == 'temp'
  node.mark = 'temp'
  node.out_edges.each do |edge|
    visit(edge.to_vertex, arr)
  end
  node.mark = 'permanent'
  arr.unshift(node)
end

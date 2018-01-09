require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's
def topological_sort(vertices)
  results = []
  top = []
  vertices.each do |vertex|
    top.push(vertex) if vertex.in_edges.empty?
  end

  until top.empty?
    current_vertex = top.shift
    results << current_vertex

    until current_vertex.out_edges.empty?
      edge = current_vertex.out_edges[0]
      dest = edge.to_vertex
      edge.destroy!
      top.push(dest) if dest.in_edges.empty?
    end

    vertices.delete(current_vertex)
  end

  top.empty? && vertices.empty? ? results : []
end

# Tarian's
# def topological_sort(vertices)
# end
#
#
# def visit(node)
# end

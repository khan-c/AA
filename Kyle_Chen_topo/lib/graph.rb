class Vertex
  attr_accessor :value, :in_edges, :out_edges, :mark

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
    @mark = "none"
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)

    @from_vertex = nil
    @to_vertex = nil
  end
end

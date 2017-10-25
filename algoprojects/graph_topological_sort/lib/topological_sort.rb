require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(verticies)
  sorted = []
  top = []
  #vertices with no dependencies
  verticies.each do |vertex|
		if vertex.in_edges.empty?
			top << vertex
		end
	end

  # debugger
  #iterate through edge destinations
	until top.empty?
		current = top.shift
		sorted << current
    destinations = current.out_edges.dup
		destinations.each do |edge|
			if edge.to_vertex.in_edges.length == 1
				top << edge.to_vertex
			end
      edge.destroy!
		end
	end

  return [] if sorted.length < verticies.length
  # debugger
	sorted
end

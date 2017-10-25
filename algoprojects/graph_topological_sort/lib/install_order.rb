# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'
require 'byebug'

def install_order(arr)
  #accounts for disconnected nodes
  max = arr.flatten.max
  values = (1..max).to_a
  #array of nodes
  nodes = values.map do |value|
    Vertex.new(value)
  end
  #creates edges
  arr.each do |tuple|
    to_vertex = nodes.select{|node| node.value == tuple[0]}.first
    from_vertex = nodes.select{|node| node.value == tuple[1]}.first
    # debugger
    Edge.new(from_vertex, to_vertex)
  end
  #topological sort
  sorted_nodes = topological_sort(nodes)
  sorted_nodes.map {|vertex| vertex.value}
end

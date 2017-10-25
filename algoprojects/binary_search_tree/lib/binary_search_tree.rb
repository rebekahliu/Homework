# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'
require 'byebug'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = BSTNode.new(value) if root == nil

    if value <= @root.value
      if @root.left
        @root.left.insert(value)
      else
        @root.left = BSTNode.new(value)
        @root.left.parent = @root
      end
    else
      if @root.right
        @root.right.insert(value)
      else
        @root.right = BSTNode.new(value)
        @root.right.parent = @root
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node == nil
    return tree_node if tree_node.value == value

    if value < tree_node.value
      find(value, tree_node.left)
    elsif value > tree_node.value
      find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value, tree_node = @root)

    #node has two children
    if node.right && node.left
      maximum = maximum(node.left)

      #set children's parent to maximum
      node.right.parent = maximum if node.right
      node.left.parent = maximum if node.left
      #set parent to left child
      if maximum.left
        maximum.left.parent = maximum.parent
        maximum.parent.right = maximum.left
      end

      #set new root children
      maximum.left = @root.left
      maximum.right = @root.right

      #set parent child to maximum
      node.parent.left = maximum

    #node has one child
    elsif node.right || node.left
      return node.parent.right = node.right if node.right
      return node.parent.left = node.left if node.left

    #node has no children
    else
      #node has parent but no children
      if node.parent
        if node.parent.value >= node.value
          node.parent.left = nil
        else
          node.parent.right = nil
        end
      #node has no parent and no children
      else
        @root = nil
      end
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right == nil

    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node == nil

    depth_left = tree_node.left ? 1 + depth(tree_node.left) : 0
    depth_right = tree_node.right ? 1 + depth(tree_node.right) : 0

    return [depth_left, depth_right].max
  end

  def is_balanced?(tree_node = @root)
    return false unless (depth(tree_node.right) - depth(tree_node.left)).abs <= 1

    right_balanced = tree_node.right ? is_balanced?(tree_node.right) : true
    left_balanced = tree_node.left ? is_balanced?(tree_node.left) : true

    right_balanced && left_balanced ? true : false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [tree_node.value] if tree_node.left == nil && tree_node.right == nil

    left = tree_node.left ? in_order_traversal(tree_node.left, arr) : []
    right = tree_node.right ? in_order_traversal(tree_node.right, arr) : []

    arr = left + [tree_node.value] + right
  end

  def self.size(tree_node)
    return 1 if tree_node.left == nil && tree_node.right == nil

    left = tree_node.left ? size(tree_node.left) : 0
    right = tree_node.right ? size(tree_node.right) : 0

    return 1 + left + right
  end

  # def post_order_traversal(tree_node = @root, arr = [])
  #   return
  #
  #   left = post_order_traversal(tree_node.left)
  #   right = post_order_traversal(tree_node.right)
  #
  #   arr = left + right + [tree_node]
  # end
  #
  # def pre_order_traversal(tree_node = @root, arr = [])
  #
  # end

  def in_order_traversal_iteratively(tree_node = @root)
    #create empty stack
    stack = Stack.new
    stack << tree_node
    #initialize current node as root
    root = tree_node
    #push current node into stack, set current as current.left until current is null
    current_node = tree_node
    until current_node == nil
      current_node = current_node.left
      stack << current_node
    end

    #pop top of stack and print
    p popped = stack.pop
    #set current_node as popped.right if popped.right exists
    current_node = popped.right if popped.right 

        #has one child
      elsif

      #

    end
  end

end

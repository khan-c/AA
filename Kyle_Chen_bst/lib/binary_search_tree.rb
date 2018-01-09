require 'bst_node'
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root
      place_node(new_node, @root)
    else
      @root = new_node
    end
  end

  def find(value, tree_node = @root)
    return nil unless tree_node

    if value == tree_node.value
      tree_node
    elsif value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value)
    if node
      if node.left.nil? && node.right.nil?
        if node.parent.nil?
          @root = nil
        elsif node.value < node.parent.value
          node.parent.left = nil
        else
          node.parent.right = nil
        end
      elsif node.left.nil?
        if node.value < node.parent.value
          node.parent.left = node.right
        else
          node.parent.right = node.right
        end
        node.right.parent = node.parent
      elsif node.right.nil?
        if node.value < node.parent.value
          node.parent.left = node.left
        else
          node.parent.right = node.left
        end
        node.left.parent = node.parent
      else
        max_node = maximum(node.left)
        delete(max_node.value)
        if node.value < node.parent.value
          node.parent.left = max_node
        else
          node.parent.right = max_node
        end
        max_node.parent = node.parent
        max_node.left = node.left
        max_node.right = node.right

      end
      node.parent = nil
      node.left = nil
      node.right = nil
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right.nil?
      tree_node = tree_node.right
    end

    tree_node
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    r_depth = 0
    l_depth = 0

    if tree_node.right
      r_depth += depth(tree_node.right) + 1
    end

    if tree_node.left
      l_depth += depth(tree_node.left) + 1
    end

    # return r_depth > l_depth ? r_depth : l_depth
    [r_depth, l_depth].max
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    r = depth(tree_node.right)
    l = depth(tree_node.left)
    r_balance = is_balanced?(tree_node.right)
    l_balance = is_balanced?(tree_node.left)
    l < r + 1 && l > r - 1 && r_balance && l_balance
  end

  def in_order_traversal(tree_node = @root, arr = [])
    # return [tree_node.value] if tree_node.right.nil? && tree_node.left.nil?

    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end


  private
  # optional helper methods go here:
  def compare_node(node1, node2)
    node1.value <=> node2.value
  end

  def place_node(node1, node2)
    if node2.nil?
      node2 = node1
      return
    end

    if compare_node(node1, node2) < 0
      if node2.left
        place_node(node1, node2.left)
      else
        node2.left = node1
        node1.parent = node2
      end
    else
      if node2.right
        place_node(node1, node2.right)
      else
        node2.right = node1
        node1.parent = node2
      end
    end
  end
end

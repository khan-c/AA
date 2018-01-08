require 'binary_search_tree'

def kth_largest(tree_node, k)
  return k if tree_node.nil?

  k = kth_largest(tree_node.right, k)

  return k if k.class == BSTNode

  k -= 1

  return tree_node if k == 0

  kth_largest(tree_node.left, k)
end

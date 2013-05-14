
class Node
    attr_accessor :value, :left, :right
    def initialize(value=nil, left=nil, right=nil)
        @value, @left, @right = value, left, right
    end
end

def insert(node, v, &block)
    # binary tree insert without balancing, 
    # block performs the comparison operation
    return Node.new(v) if not node
    case block[v, node.value]
        when -1 
            node.left = insert(node.left, v, &block)
        when 1 
            node.right = insert(node.right, v, &block)
    end
    return node
end

def visit(n, order=:preorder, &block)
    # visit nodes in a binary tree, order can be determinied
    # block performs visit action
    return false unless (n != nil)


    case order 
        when :preorder 
            yield n.value
            visit(n.left, order, &block)
            visit(n.right, order, &block)
        when :inorder
        unless n.left.nil?
          visit(n.left, order, &block) 
        end
            yield n.value
      unless n.right.nil?
        visit(n.right, order, &block)
      end
      p "back"
        when :postorder
            visit(n.left, order, &block)
            visit(n.right, order, &block)
            yield n.value
    end
end


# a simple test case
root = nil

[5,3,4,12,115].each {|c| root = insert(root, c) {|a,b| a<=>b}}
visit(root, :inorder) {|v| print v.to_s + "\n"}


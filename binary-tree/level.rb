class Node
    attr_accessor :value, :left, :right
    def initialize(value=nil, left=nil, right=nil)
        @value, @left, @right = value, left, right
    end
end

def search_level node, l, level=0, &block
  return level if node.nil?
  level += 1
  if level == l
    yield node
  end
  search_level(node.left, l, level, &block)
  search_level(node.right, l, level, &block)
end

node = Node.new("A",
                Node.new("B",
                         Node.new("D")),
                Node.new("C",
                         Node.new("E"),
                         Node.new("F")))

search_level(node, 2){|n| p n.value}

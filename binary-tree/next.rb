# This is impliment of http://get-that-job-at-google.blogspot.jp/2013/01/facebook-interview-experience.html
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

class T
  def initialize node
    @node = node
    @route = [[node, "left"]]
    @from_right_back = false
  end

  def next
    if @from_right_back || (@node.left.nil? && @node.right.nil?)
      @ret_node = @node
      back
      return @ret_node
    end

    unless @node.left.nil?
      @route << [@node, "left"]
      @node = @node.left
      return self.next
    end
    unless @node.right.nil?
      @route << [@node, "right"]
      @node = @node.right
      return self.next
    end
  end

  def back
    @current = @route.pop
    if @current[1] == "left" && @current[0].right
      @node = @current[0].right
      @current[1] = "right"
      @route << @current 
      @from_right_back = false
    else 
      @node = @current[0]
      @from_right_back = true
    end
  end

end

node = Node.new("2", 
                Node.new("7", 
                         Node.new("2"),
                         Node.new("6",
                                  Node.new("5"),
                                  Node.new("11"))),
                Node.new("5",
                         nil,
                         Node.new("9",
                                  Node.new("4"))))


t = T.new(node)
p t.next().value
p t.next().value
p t.next().value
p t.next().value
p t.next().value
p t.next().value
p t.next().value
p t.next().value
p t.next().value

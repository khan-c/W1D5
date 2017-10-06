class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def dfs(target_value)
    return self if value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue.concat(current_node.children)
    end
    nil
  end

  def parent
    @parent
  end

  def parent=(parent_node)
    if @parent != parent_node
      if parent_node
        if @parent
          @parent.remove_child(self)
        end
        @parent = parent_node
        parent_node.children << self
      else
        @parent = nil
      end
    end
  end

  def remove_child(child_node)
    raise "not my kid" unless @children.include?(child_node)

    child_node.parent = nil
    @children.delete(child_node)
  end

  def children
    @children
  end

  def show_children
      @children.each do |child|
        puts child.value
      end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def value
    @value
  end
end

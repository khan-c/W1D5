class KnightPathFinder

  RELATIVE_MOVES = [
    [-2,-1],
    [-2,1],
    [2,-1],
    [2,1],
    [1,-2],
    [1,2],
    [-1,-2],
    [-1,2]
  ]

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]

  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos)
  end

  def self.valid_moves(pos)
    possible = []
    RELATIVE_MOVES.each do |rel_pos|
      possible << [pos[0] + rel_pos[0], pos[1] + rel_pos[1]]
    end
    possible - @visited_positions
    possible.select! do |position|
      (0..7).cover?(position.first) && (0..7).cover?(position.last)
    end

    @visited_positions.concat(possible)
    return possible
  end

  # def is_node(maybe)
  #   if maybe.is_a?(PolyTreeNode)
  #     return maybe
  #   else
  #     return PolyTreeNode.new(maybe)
  #   end
  # end


  def build_move_tree
    root_node = PolyTreeNode.new(@start_pos)
    node_queue = [root_node]

    until node_queue.empty?
      current_node = node_queue.shift

      child_moves = new_move_positions(current_node.value)

      child_moves.each do |child_pos|
        child_node = PolyTreeNode.new(child_pos)
        child_node.parent = current_node
        node_queue << child_node
      end
    end
  end

  # def bfs(target_value)
  #   queue = [self]
  #
  #   until queue.empty?
  #     current_node = queue.shift
  #     return current_node if current_node.value == target_value
  #     queue.concat(current_node.children)
  #   end
  #   nil
  # end

  def find_path

  end

end

require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

  RELATIVE_MOVES = [
    [-2, -1],
    [-2, 1],
    [2, -1],
    [2, 1],
    [1, -2],
    [1, 2],
    [-1, -2],
    [-1, 2]
  ]

  attr_reader :visited_positions

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos)
    possible_moves -= @visited_positions
    @visited_positions.concat(possible_moves)
    possible_moves
  end

  def self.valid_moves(pos)
    possible = []
    RELATIVE_MOVES.each do |rel_pos|
      possible << [pos[0] + rel_pos[0], pos[1] + rel_pos[1]]
    end

    possible.select! do |position|
      (0..7).cover?(position.first) && (0..7).cover?(position.last)
    end

    possible
  end

  def build_move_tree
    @root = PolyTreeNode.new(@start_pos)
    node_queue = [@root]

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
  # def dfs(target_value)
  #   return self if value == target_value
  #
  #   children.each do |child|
  #     result = child.dfs(target_value)
  #     return result if result
  #   end
  #   nil
  # end

  def find_path(end_pos)
    trace_path_back(@root.dfs(end_pos))

  end

  def trace_path_back(node)

    return [node.value] if node.parent == nil

    trace_path_back(node.parent) + [node.value]

  end

end

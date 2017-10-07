require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # TODO figure out what to set this to. this method is likely called
    # on a child node of this node to check if that node would be a losing node.
    # if @board.over? && @board.winner !=
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_marker = [:x,:o].reject {|mark| mark == @next_mover_mark}.first
    @children = []

    (0..2).each do |x|
      (0..2).each do |y|
        pos = [x,y]
        if @board.empty?(pos)
          dupboard = @board.dup
          dupboard[pos] = @next_mover_mark

          prev_move_pos = pos
          @children << TicTacToeNode.new(dupboard, next_marker, prev_move_pos)
        end
      end
    end
    @children
  end

  def switch_mark
    if @next_mover_mark == :x
      @next_mover_mark = :o
    else
      @next_mover_mark = :x
    end
  end

end

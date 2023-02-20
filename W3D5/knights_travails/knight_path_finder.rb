require_relative "tree_node.rb"
require "byebug"

class KnightPathFinder
  MOVES = [
    [2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]
  ]

  # [row+2, col+1], [row+2, col-1] [row-2, col+1], [row-2, col-1]
  # [row+1, col-2] [row-1, col+2] [row-1, col-2], [row+1, col+2]

  def self.root_node(pos)
    row, col = pos
    PolyTreeNode.new(pos)
  end

  #from 0 to 7
  #moves are all possible directions like a slope on a graph

  def self.valid_moves(pos)
    row, col = pos
    valids = []
    MOVES.each_with_index do |x, i|
      valids << [pos[0].to_i + MOVES[i][0], pos[1].to_i + MOVES[i][1]]
    end

    valids.select do |pos|
      x = pos[0]
      y = pos[1]
      (x >= 0 && x < 8) && (y >= 0 && y < 8)
    end
  end

  def initialize(pos)
    initial_pos = KnightPathFinder.root_node(pos)
    @considered_positions = [initial_pos]
  end

  def new_move_positions(pos)

    if !@considered_positions.include?(pos)

      pos
      @considered_positions << pos
    end
  end

end

if $PROGRAM_NAME == __FILE__
  p KnightPathFinder.root_node([0,0])
  p KnightPathFinder.valid_moves([0,0])
  p KnightPathFinder.valid_moves([7,7])
end

require_relative "tree_node.rb"

class KnightPathFinder
  MOVES = [
    [-2,-1]
  ]


  def self.root_node(pos)
    row, col = pos
    PolyTreeNode.new(pos)
  end

  #from 0 to 7
  #moves are all possible directions like a slope on a graph
  
  def self.valid_moves(pos)
    valids = []

  end

  #[0,0] [2,1] []

  #[4,4] =>
  # [row+2, col+1], [row+2, col-1] [row-2, col+1], [row-2, col-1]
  # [row+1, col-2] [row-1, col+2] [row-1, col-2], [row+1, col+2]
  # [row-1, col-2]

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

if $PROGRAM_NAME == __FILE__
  p KnightPathFinder.root_node([0,0])
end

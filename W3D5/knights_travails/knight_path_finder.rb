require_relative "tree_node.rb"
require "byebug"

class KnightPathFinder
  MOVES = [
    [2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]
  ]

  # def self.root_node(pos)
  #   PolyTreeNode.new(pos)
  # end

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
    @initial_pos = pos
    @considered_positions = [@initial_pos]
    @root_node = PolyTreeNode.new(pos)
    @tree = self.build_move_tree
  end

  def root_node
    @root_node
  end


  def considered_positions
    @considered_positions
  end

  def new_move_positions(pos)
    valid = KnightPathFinder.valid_moves(pos)
    new_positions = valid.select {|ele| !@considered_positions.include?(pos) }
    @considered_positions += new_positions
    new_positions
  end

  def build_move_tree
    nodes = [@root_node] #[[0,0]]

    until nodes.empty?
      first_node = nodes.shift #[0,0]
      new_positions = new_move_positions(first_node.value)

      new_positions.each do |pos|
        new_node = PolyTreeNode.new(pos)
        first_node.add_child(new_node)
        nodes << new_node #[[2,1], [1,2]]
      end
    end
  end

  #we are searching for the end position,
  #use .dfs(end_pos) or .bfs(end_pos)
  #returning the tree node instance containing end position. looking for a node.value == end_position
  def find_path(end_pos)

    end_node = @root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)

    node_path = []
    until end_node.parent.nil?
      node_path.unshift(end_node.parent)
    end

    return node_path

  end

#   def parent=(new_parent)
#     if @parent
#       @parent.children.delete(self)
#     end

#     @parent = new_parent

#     if @parent != nil
#         new_parent.children.push(self)
#     end
# end

end

if $PROGRAM_NAME == __FILE__
  # p KnightPathFinder.root_node([0,0])
  # p KnightPathFinder.valid_moves([0,0])
  # p KnightPathFinder.valid_moves([7,7])

  # p test.new_move_positions([7,7])
  # p test.considered_positions
#   test = KnightPathFinder.new([0,0])
#  test.new_move_positions([0,0])
#   # print test.build_move_tree
#   puts test.find_path([2,1])
print kpf = KnightPathFinder.new([0, 0])
print kpf.find_path([7, 6]) 
puts kpf.find_path([6, 2])
end


# Knight's Travails Continued (Part 2)

# **Finish Phases I & II before continuing!**

# ## Phase III: `#find_path`

# Now that you have created your internal data structure (the move tree stored in
# `self.root_node`), you can traverse it to find the shortest path to any position
# on the board from your original `@start_pos`.

# Create an instance method `#find_path(end_pos)` to search for `end_pos` in the
# move tree. You can use either `dfs` or `bfs` search methods from the
# `PolyTreeNode` exercises; it doesn't matter. This should return the tree node
# instance containing `end_pos`.

# This gives you a node, but not a path. Lastly, add a method `#trace_path_back`
# to `KnightPathFinder`. This should trace back from the node to the root using
# `PolyTreeNode#parent`. As it goes up-and-up toward the root, it should add each
# value to an array. `#trace_path_back` should **return** the values in order from
# the start position to the end position.

# Use `#trace_path_back` to finish up `#find_path`.

# Here are some example paths that you can use for testing purposes. (Your
# sequences might differ but should be the same number of steps.)

# ```ruby
# kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
# kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
# ```
require_relative "pieces"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def grid
    @grid
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def dup

  end

  def move_piece(color,from_pos,to_pos)

  end

  def move_piece!(color,from_pos,to_pos)

  end

  def checkmate?

  end

  protected
  def find_king(color)

  end

end

# bo = Board.new
# bo[[6, 1]] = Pawn.new(:white, bo, [6, 1])
# bo[[5, 1]] = Rook.new(:black, bo, [5, 1])
# bo[[5, 0]] = Rook.new(:black, bo, [5, 0])
# bo[[5, 2]] = Rook.new(:black, bo, [5, 2])
# # bo[[1, 2]] = Rook.new(:black, bo, [1, 2])
#  p bo[[6, 1]].moves

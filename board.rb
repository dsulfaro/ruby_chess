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

bo = Board.new
bo[[0, 0]] = Queen.new(:white, bo, [0, 0])
# bo[[0, 1]] = Rook.new(:black, bo, [0, 1])
 p bo[[0, 0]].moves

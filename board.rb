require_relative "pieces/piece"
require_relative "pieces/null"
require "byebug"

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

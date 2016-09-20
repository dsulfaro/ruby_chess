require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include SlidingPiece

  def symbol
    :Q
  end

  protected

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

end

require_relative "piece"
require_relative "stepable"

class King < Piece
  include SteppingPiece

  def symbol
    :KG
  end

  protected

  def move_diffs
    #make our own
  end

end

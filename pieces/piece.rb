class Piece

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }


  def initalize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
  end

  def empty?
    false
  end

  def symbol
  end

  def valid_moves
  end

  private
  def move_into_check?(to_pos)

  end
end

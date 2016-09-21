class Piece

  attr_reader :color, :pos

  def initialize(color, board, pos)
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
    self.moves.reject do |coords|
      move_into_check?(coords)
    end
  end

  def valid_move?(pos)
    x, y = pos

    return false if x < 0 || x > 7
    return false if y < 0 || y > 7
    return false if @board[[x,y]].color == @color


    true
  end

  private

  def move_into_check?(to_pos)
    cpy = @board.dup
    cpy[@pos] = NullPiece.instance
    cpy[to_pos] = self
    cpy.in_check?(@color)

  end


end

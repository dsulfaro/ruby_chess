module SteppingPiece

  def moves
    move = []
    x, y = @pos
    move_diffs.each do |positions|
      dx, dy = positions
      new_pos = [(x + dx), (y + dy)]

      move << new_pos if self.valid_move?(new_pos)
    end

    move
  end

  private

  def move_diffs
  end

end

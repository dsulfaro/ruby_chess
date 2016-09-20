module SteppingPiece

  def moves
    moves = []
    x, y = @pos
    move_diffs.each do |positions|
      dx, dy = positions
      new_pos = [(x + dx), (y + dy)]

      moves << new_pos if self.valid_pos?(new_pos)
    end

    moves
  end

  private

  def move_diffs
  end

end

module SlidingPiece

  def moves
  end

  private
  def move_dirs
  end

  def horizontal_dirs
    dirs = []
    x,y = self.pos

    MOVES.each do |k,v|
      new_pos = [v.first + x, v.last + y]
      dirs << new_pos
    end

    dirs
  end

  def diagonal_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end

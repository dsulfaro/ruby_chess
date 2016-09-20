module SlidingPiece

  HORIZONTAL_DIRS = [
    [0, -1],
    [0, 1],
    [-1, 0],
    [1, 0]
  ]

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]


  def moves
    moves = []

    move_dirs.each do |coord|
      coord_1, coord_2 = coord

      moves.concat(grow_unblocked_moves_in_dir(coord_1,coord_2))
    end

    moves
  end

  private
  def move_dirs
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end


  def grow_unblocked_moves_in_dir(dx, dy)
    x,y = @pos
    unblocked_moves = []

    x += dx
    y += dy

    while (self.valid_move?([x,y])) && (@board[[x,y]].is_a? NullPiece)
      unblocked_moves << [x,y]
      x += dx
      y += dy
    end

    # if there's an enemy, add that position as well
    unblocked_moves << [x,y] if (self.valid_move?([x,y]))
    unblocked_moves
  end

end

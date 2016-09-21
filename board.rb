require_relative "pieces"

class Board

  attr_reader :grid

  def initialize(grid = Array.new(8) { Array.new(8) { NullPiece.instance } })
    @grid = grid
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
    cpy = self.grid.map do |spot|
        spot.map do |piece|
          if piece.is_a? NullPiece
            NullPiece.instance
          else
          (piece.class).new(piece.color, self, piece.pos)
        end
      end
    end
    Board.new(cpy)
  end

  def move_piece(color,from_pos,to_pos)

  end

  def move_piece!(color,from_pos,to_pos)

  end

  def in_check?(color)
    king_pos = find_king(color)
    op_color = ((color == :black) ? :white : :black)
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        if self[[i, j]].color == op_color
          return true if (self[[i, j]].moves).include?(king_pos)
        end
      end
    end
    false
  end

  def checkmate?(color)
    return false unless in_check?(color)

    @grid.each_index do |i|
      @grid[i].each_index do |j|
        next if (self[[i,j]].color != color) || (self[[i,j]].is_a? (NullPiece))
        p self[[i,j]].moves
        return false unless (self[[i,j]].valid_moves.empty?)
      end
    end
    true
  end

  protected
  def find_king(color)
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid.length
        space = self[[i, j]]
        return [i, j] if space.is_a?(King) && space.color == color
        j += 1
      end
      i += 1
    end
  end


end


bo = Board.new
bo[[6, 1]] = King.new(:white, bo, [6, 1])
bo[[0, 0]] = Queen.new(:black, bo, [0, 0])
bo[[0, 1]] = Queen.new(:black, bo, [0, 1])
bo[[0, 2]] = Queen.new(:black, bo, [0, 2])

# bo[[5, 0]] = Rook.new(:black, bo, [5, 0])
# bo[[5, 2]] = Rook.new(:black, bo, [5, 2])
# bo[[1, 2]] = Rook.new(:black, bo, [1, 2])
# p bo.in_check?(:white)
# co = bo.dup
# co[[6,1]].color = :red
# co[[6,1]] = Pawn.new(:black, co, [6,1])
# p bo[[6,1]].checkmate?(:white)
# p bo[[6, 1]].moves
# p bo[[6, 1]].valid_moves
#p bo.checkmate?(:white)
# p bo[[6,1]].color
# p co[[6,1]].symbol
# p bo[[6, 1]].move_into_check?([6,2])

p bo[[6, 1]].valid_moves

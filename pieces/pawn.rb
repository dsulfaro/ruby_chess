require_relative "piece"
require_relative "stepable"

class Pawn < Piece
  include SteppingPiece

  def symbol
    :P
  end

  protected

  def can_attack?(dx, dy)
    prop_pos = [@pos.first + dx, @pos.last + dy]
    prop_color = @board[prop_pos].color

    x, y = pos

    # return false if x < 0 || x > 7
    # return false if y < 0 || y > 7

    return true if (prop_color != @color && prop_color != :none)

    return false unless @board[prop_pos].is_a? NullPiece


    false
  end

  def attack_spots
    attack = []
    case @color
    when :black
      attack << [1,-1] if can_attack?(1, -1)
      attack << [1, 1] if can_attack?(1, 1)
    when :white
      attack << [-1, -1] if can_attack?(-1, -1)
      attack << [-1, 1] if can_attack?(-1, 1)
    end

    attack
  end

  def move_diffs
    case @color
    when :black
    b_moves = []
      if @board[[@pos.first + 1, @pos.last]].color == :none
        b_moves << [1,0]
        b_moves << [2,0] if @pos.first == 1
      end
      b_moves.concat(attack_spots)
    when :white
      w_moves = []
      if @board[[@pos.first - 1, @pos.last]].color == :none
        w_moves << [-1,0]
        w_moves << [-2, 0] if @pos.first == 6
      end
      w_moves.concat(attack_spots)
    end
  end

end

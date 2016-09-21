require "singleton"

class NullPiece
  include Singleton

  def to_s
    "[ ]"
  end

  def color
    :none
  end

  def moves
    []
  end

  def empty?
    true
  end

end

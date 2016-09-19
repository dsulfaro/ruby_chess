require_relative "cursor"

class Display
  def initalize(board)
    @cursor = Cursor.new([0,0], board)
  end

  def render

  end

end

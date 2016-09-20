require_relative "cursor"
require_relative "board"
require "colorize"
require "byebug"

class Display

  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render_visuals
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        pos = [i, j]
        if [i, j] == @cursor.cursor_pos
          print @board[pos].to_s.colorize(:red)
        else
          print @board[pos].to_s
        end
      end
      print "\n"
    end
  end

end

b = Board.new
d = Display.new(b)
d.render_visuals

while true
  d.cursor.get_input
  system("clear")
  d.render_visuals
end

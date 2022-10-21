class Game 
  attr_reader :board
  def initialize
    @board = Board.new
    @board.create_layout
  end
end 
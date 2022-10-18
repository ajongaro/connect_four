class Board
  attr_reader :layout

  def initialize
    @layout = {}
    create_layout
  end

  def create_layout
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = "."
      end
    end
  end
end

# board = Board.new
# board.create_layout
# puts board.layout
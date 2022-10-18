require './lib/space'

class Board
  attr_reader :layout

  HEADER = "ABCDEFG"

  def initialize
    @layout = {}
    create_layout
  end

  def create_layout
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = Space.new
      end
    end
  end

  def display_board 
   "#{HEADER}\n" 
    #need to finish this
  end
end


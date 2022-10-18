require './lib/space'

class Board
  attr_reader :layout

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
end


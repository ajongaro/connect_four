require './lib/board'
require './lib/space'

board = Board.new
board.create_layout

def build_layout
  (1..6).each do |number|
    ("A".."G").to_a.each do |letter|
      print "#{letter}#{number}".to_sym
    end
    puts "\n"
  end
end

build_layout

# def create_layout
#   ("A".."G").to_a.each do |letter|
#     (1..6).each do |number|
      
#     end
#   end
# end

# board.layout.each do |key, value|
#   puts value.slot
# end
# puts "#{board.layout[:A1].slot}"

# def create_layout
#   board.layout.each do |key, value|
#     (1..6).each do |number|
#       @layout["#{letter}#{number}"]
#     end
#   end
# end
# board = Board.new
# board.create_layout
# p board.layout.values
# puts "ABCDEFG"
#  ".......\n"
#  ".......\n"
#  ".......\n"
#  ".......\n"
#  ".......\n"
#  ".......\n"

# print "....#{"O"}..\n"
# print "#{space_1.value}#{space_2}#{space_3}#.....\n"

# :A1 => space_2
# :A2 => space_1

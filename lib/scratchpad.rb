require './lib/board'
require './lib/space'

board = Board.new

a_column_keys = [:A6, :A5, :A4, :A3, :A2, :A1]
b_column_keys = [:B6, :B5, :B4, :B3, :B2, :B1]
c_column_keys = [:C6, :C5, :C4, :C3, :C2, :C1]
d_column_keys = [:D6, :D5, :D4, :D3, :D2, :D1]
e_column_keys = [:E6, :E5, :E4, :E3, :E2, :E1]
f_column_keys = [:F6, :F5, :F4, :F3, :F2, :F1]
g_column_keys = [:G6, :G5, :G4, :G3, :G2, :G1]

board.layout.reverse_each do |key, value|
  if bob.include?(key) && value.available == true
    value.add("X")
    break
  end
end

board.layout.reverse_each do |key, value|
  if bob.include?(key) && value.available == true
    value.add("X")
    break
  end
end

board.layout.reverse_each do |key, value|
  if bob.include?(key) && value.available == true
    value.add("X")
    break
  end
end

puts board.display_board


# require 'pry'; binding.pry



# def build_layout
#   (1..6).each do |number|
#     ("A".."G").to_a.each do |letter|
#       print "#{letter}#{number}".to_sym
#     end
#     puts "\n"
#   end
# end

# build_layout

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

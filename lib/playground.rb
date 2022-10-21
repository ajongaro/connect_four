require './lib/game'

game = Game.new
game.main_menu_prompt
print game.board.pretty_print
















































# require './lib/board'
# require './lib/space'
# require './lib/turn'
# 
# class BoardPrinter
#   attr_reader :layout, :header

#   def initialize
#     @layout = {}  
#     @header = "ABCDEFG"
#     create_layout
#   end

#   def create_layout
#     ("A".."G").to_a.each do |letter|
#       (1..6).each do |number|
#         @layout["#{letter}#{number}".to_sym] = Space.new
#       end
#     end
#   end

#   def pretty_print
#     array = ["ABCDEFG\n"]
#     (1..6).to_a.each do |number|
#       ("A".."G").each do |letter|
#          array << @layout["#{letter}#{number}".to_sym].slot 
#       end
#       array << "\n"
#     end
#     array.join("")
#   end


#   def search_for_winner
#     horizontal_win
#     vertical_win
#   end

#   # start with horizontal wins only
#   def horizontal_win 
#     array = []
#     6.downto(1).to_a.each do |number|
#       ("A".."G").each do |letter|
#          array << @layout["#{letter}#{number}".to_sym].slot 
#       end
#       if array.join("").include?("XXXX")
#         puts "HORIZONTAL X WIN"
#       elsif array.join("").include?("OOOO") 
#         puts "HORIZONTAL O WIN"
#       end
#       array.clear
#     end
#   end

#   def vertical_win 
#     array = []
#     ("A".."G").each do |letter|
#       6.downto(1).to_a.each do |number|
#          array << @layout["#{letter}#{number}".to_sym].slot 
#       end
#       if array.join("").include?("XXXX")
#         puts "VERTICAL X WIN"
#       elsif array.join("").include?("OOOO") 
#         puts "VERTICAL O WIN"
#       end
#       array.clear
#     end
#   end
 
#   @diag_array = []
#   @diag_win = false

#   def left_to_right_diag_win(space)
#     # return if diag_array does not contain a win && space == nil
#     # go left up the a column
#     space = space.to_s.split("")
#     space[0] = space[0].next
#     space[1] = space[1].to_i.pred.to_s
#     new_space = space.join("").to_sym
#     left_to_right_diag_win(new_space) 
#     # go right across 6 row
#   end
# end

# printed_board = BoardPrinter.new

# print printed_board.pretty_print
# print "\n\n"

# printed_board.left_to_right_diag_win(printed_board.layout[:A6])
# printed_board.layout[:A6].add("X")
# printed_board.layout[:B6].add("X")
# printed_board.layout[:C6].add("X")
# printed_board.layout[:D6].add("X")

# print printed_board.pretty_print
# printed_board.search_for_winner

# puts "FIRST ROUND COMPLETE"

# second_board = BoardPrinter.new
# second_board.layout[:G5].add("O")
# second_board.layout[:G4].add("O")
# second_board.layout[:G3].add("O")
# second_board.layout[:G2].add("O")

# print second_board.pretty_print
# second_board.search_for_winner

































# # class ArrayMaker
# #   attr_reader :one_line, :full_array

# #   def initialize
# #     @full_array = []
# #     build_array
# #   end

# #   def build_array
# #     3.times do
# #       @one_line = []
# #       7.times do 
# #         @one_line << Space.new
# #       end
# #       @full_array << @one_line
# #     end
# #   end

# #   def print_array
# #     puts "ABCDEFG"
# #     @full_array.each do |x|
# #       x.each do |y|
# #         print y.slot
# #       end
# #       puts "\n"
# #     end
# #   end
# # end


# # ArrayMaker.new.full_array.each do |line|
# #   print line.slot
# #   puts "\n"
# # end


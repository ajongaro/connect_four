# require './lib/game'

# game = Game.new
# game.main_menu_prompt





# def diag_from_left
  


# end


# A4..D1
# A5..E1
# A6..F1
# B6..G1
# C6..G2
# D6..G3

# G4..D1
# G5..C1
# G6..B1
# F6..A1
# E6..A2
# D6..A3

# --> 

# A1..F6
# A2..E6
# A3..D6        iterate A1-A6, code way to find diagonal between there and end cells (F6E6D6, D1E1F1)
# A4..D1
# A5..E1
# A6..F1
# G1..B6        iterate G1-G6 code way to find diagonal between there and end cells (B6C6D6, D1C1B1)
# G2..C6
# G3..D6
# G4..D1
# G5..C1
# G6..B1


# if number in first cell is < number in last cell, iterate down in numbers
# if number in first cell is > number in last cell iterate up
# if letter in first cell is > letter in last cell, iterate down
# if letter in first cell is < letter in last cell, iterate up

# so if A6..F1, iterate UP in letters and DOWN in numbers ie A B C D E F, 6 5 4 3 2 1

# 
# def upright_checker
# all_slots = []
# all_slots << start_coord[letter.next][number + 1].slot 
# all_slots.include("XXXX") || all_slots.include ("OOOO")

# [A1..A3, B6, D6, E6].map do |start_coord|
# start_coord.upright_checker

# repeat this^ for up left checker, with dif array

# MAKE THIS WITH CODE AND WE BALLLLLLINNNNN

def diag_1
    "#{@layout[:A4]}#{@layout[:B3]}#{@layout[:C2]}#{@layout[:D1]}"
  end

  def diag_2
    "#{@layout[:A5]}#{@layout[:B4]}#{@layout[:C3]}#{@layout[:D2]}#{@layout[:E1]}"
  end

  def diag_3
    "#{@layout[:A6]}#{@layout[:B5]}#{@layout[:C4]}#{@layout[:D3]}#{@layout[:E2]}#{@layout[:F1]}"
  end

  def diag_4
    "#{@layout[:B6]}#{@layout[:C5]}#{@layout[:D4]}#{@layout[:E3]}#{@layout[:F2]}#{@layout[:G1]}"
  end

  def diag_5
    "#{@layout[:C6]}#{@layout[:D5]}#{@layout[:E4]}#{@layout[:F3]}#{@layout[:G2]}"
  end

  def diag_6
    "#{@layout[:D6]}#{@layout[:E5]}#{@layout[:F4]}#{@layout[:G3]}"
  end

  def diag_7
    "#{@layout[:G4]}#{@layout[:F3]}#{@layout[:E2]}#{@layout[:D1]}"
  end

  def diag_8
    "#{@layout[:G5]}#{@layout[:F4]}#{@layout[:E3]}#{@layout[:D2]}#{@layout[:C1]}"
  end

  def diag_9
    "#{@layout[:G6]}#{@layout[:F5]}#{@layout[:E4]}#{@layout[:D3]}#{@layout[:C2]}#{@layout[:B1]}"
  end

  def diag_10
    "#{@layout[:F6]}#{@layout[:E5]}#{@layout[:D4]}#{@layout[:C3]}#{@layout[:B2]}#{@layout[:A1]}"
  end

  def diag_11
    "#{@layout[:E6]}#{@layout[:D5]}#{@layout[:C4]}#{@layout[:B3]}#{@layout[:A2]}"
  end

  def diag_12
    "#{@layout[:D6]}#{@layout[:C5]}#{@layout[:B4]}#{@layout[:A3]}"
  end









































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


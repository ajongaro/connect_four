require './lib/board'
require './lib/space'
require './lib/turn'

class BoardPrinter
  attr_reader :layout, :header

  def initialize
    @layout = {}  
    @header = "ABCDEFG"
    create_layout
  end

  def create_layout
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = Space.new
      end
    end
  end

  def pretty_print
    puts @header
    (1..6).to_a.each do |number|
      ("A".."G").each do |letter|
         print @layout["#{letter}#{number}".to_sym].slot 
      end
      puts "\n"
    end
  end
end

printed_board = BoardPrinter.new

printed_board.pretty_print

printed_board.layout[:A6].add("X")
printed_board.layout[:B6].add("X")
printed_board.layout[:C6].add("X")
printed_board.layout[:D6].add("X")

printed_board.pretty_print

































# class ArrayMaker
#   attr_reader :one_line, :full_array

#   def initialize
#     @full_array = []
#     build_array
#   end

#   def build_array
#     3.times do
#       @one_line = []
#       7.times do 
#         @one_line << Space.new
#       end
#       @full_array << @one_line
#     end
#   end

#   def print_array
#     puts "ABCDEFG"
#     @full_array.each do |x|
#       x.each do |y|
#         print y.slot
#       end
#       puts "\n"
#     end
#   end
# end


# ArrayMaker.new.full_array.each do |line|
#   print line.slot
#   puts "\n"
# end


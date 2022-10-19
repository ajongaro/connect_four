require './lib/board'
require './lib/space'

class ArrayMaker
  attr_reader :one_line, :full_array

  def initialize
    @full_array = []
    build_array
  end

  def build_array
    3.times do
      @one_line = []
      7.times do 
        @one_line << Space.new
      end
      @full_array << @one_line
    end
  end

  def print_array
    puts "ABCDEFG"
    @full_array.each do |x|
      x.each do |y|
        print y.slot
      end
      puts "\n"
    end
  end
end

an_array = ArrayMaker.new
an_array.build_array

an_array.print_array
an_array.full_array[5][0].add("X")
an_array.print_array
an_array.full_array[4][0].add("O")
an_array.print_array


# ArrayMaker.new.full_array.each do |line|
#   print line.slot
#   puts "\n"
# end

puts "hello".exclude? "o"
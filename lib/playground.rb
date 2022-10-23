 require './lib/board'
 require './lib/game'

# game = Game.new
# game.main_menu_prompt

$board = Board.new
$bulk_array = []

def generate_diagonal_array(start, direction)
  current_location = start
  until $board.layout[current_location].nil?
    $bulk_array << $board.layout[current_location]
    current_location = start.to_s.split("")
    current_location[0] = combine(current_location[0], direction)
    current_location[1] = (current_location[1].to_i - 1).to_s
    next_location = current_location.join("").to_sym
    if $board.layout[next_location].nil?
      $bulk_array << "NOPE"
      break
    end
    generate_diagonal_array(next_location, direction)
  end
end

def combine(loc, direction)
  if direction == "up"
    return (loc.ord + 1).chr
  elsif direction == "down"
    return (loc.ord - 1).chr 
  end
end

diag_start_keys = [:A4, :A5, :A6, :B6, :C6, :D6]
diag_start_keys2 = [:G4, :G5, :G6, :F6, :E6, :D6]

starting_keys.each do |key|
  generate_diagonal_array(key, "up")
end

second_keys.each do |key|
  generate_diagonal_array(key, "down")
end

$bulk_array.include? "XXXX" || $bulk_array.include? "0000"







































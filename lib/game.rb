require './lib/board'
require './lib/turn'
class Game 
  attr_reader :board

  def initialize
    @board = Board.new # remove this from here and generate new board in new_board
    # main_menu_prompt
  end

  def new_board 
    @board = Board.new
  end

  def game_play 
    print_board
    while !@board.winner?
      puts "\n"
      player_prompt
      if @board.winner?
        print_board
        puts "\nYou Win!\n\n"
        new_board
        return main_menu_prompt
      elsif @board.tie?
        print_board
        puts "\nTie Game!\n\n"
        new_board
        return main_menu_prompt 
      end

      computer_turn
      if @board.winner?
        print_board
        puts "\nYou Lose!\n\n"
        new_board
        return main_menu_prompt 
      elsif @board.tie?
        print_board
        puts "\nTie Game!\n\n"
        new_board
        return main_menu_prompt 
      end
      print_board
    end
  end

  def welcome_message
    "Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit."
    # consider just looping "Enter 'p' etc every failed start"
  end

  def main_menu_prompt
    puts welcome_message
    input = gets.chomp
    puts "\n"
    if input.downcase == 'q'
      quit_game
    elsif input.downcase == 'p'
      game_play 
    else
      puts "Invalid selection.\n\n"
      main_menu_prompt
    end
  end

  def quit_game
    begin
      exit
    rescue SystemExit
      puts "Everybody quits, eventually..."
    end
  end

  def player_prompt
    print "Please Select a Column: "

    column_selection = gets.chomp.upcase
    puts "\n"
    turn = Turn.new(column_selection, @board)

    if turn.valid_column?
      turn.drop_token(column_selection, "X") 
    else
      puts "Please Make a Valid Selection"
      player_prompt
    end
  end

  def computer_turn
    column = @board.random_column 
    turn = Turn.new(column, @board)

    if turn.valid_column?
      turn.drop_token(column, "O")
    else
      computer_turn
    end
  end

  def print_board
    print @board.pretty_print
  end
end

# LOOP START -----------------------------
# Display game board

# Prompt player for first piece

# check for valid column
# drop piece into proper position
# if column is invalid, display error and prompt
#for valid column

# Display updated game board

# computer iterates through to find valid col
# computer places piece on board (O)

# LOOP END ----------------------------
# loops until game over conditions are met

# 1) player wins
# 2) computer wins
# 3) no winner

# print out results of game (you win, hopefully)
# spit back to main menu (at top)
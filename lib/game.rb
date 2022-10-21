require './lib/board'
require './lib/turn'
class Game 
  attr_reader :board

  def initialize
    @board = Board.new
    # main_menu_prompt
  end

  def game_play 
    while @board.search_for_winner == false
      print_board

      player_prompt
      if @board.search_for_winner
        p "You Win!"
        break
        #RETURN TO MAIN MENU
      elsif @board.tie?
        p "Tie Game!"
        break
        #RETURN TO MAIN MENU
      end

      computer_turn
      if @board.search_for_winner
        p "You Lose!"
        break
        #RETURN TO MAIN MENU
      elsif @board.tie?
        p "Tie Game!"
        break
      end
    end
    # loop player / computer turn sequence and assessment
  end

  def welcome_message
    "Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit."
    # consider just looping "Enter 'p' etc every failed start"
  end

  def main_menu_prompt
    puts welcome_message
    var = gets.chomp
    if var.downcase == 'q'
      quit_game
    elsif var.downcase == 'p'
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
    puts "Please Select a Column: 'ABCDEFG'"
    column_selection = gets.chomp.upcase
    turn = Turn.new(column_selection, @board)

    if turn.valid_column?
      turn.drop_token(column_selection, "X") 
    else
      puts "Please Make a Valid Selection"
      player_prompt
    end
  end

  def computer_turn
    array = ["A", "B", "C", "D", "E", "F", "G"]
    turn = Turn.new(array.sample, @board)

    if turn.valid_column?
      turn.drop_token(array.sample, "O")
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
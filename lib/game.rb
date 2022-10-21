class Game 
  attr_reader :board
  def initialize
    @board = nil
    main_menu_prompt
  end

  def game_play 
    @board = Board.new
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
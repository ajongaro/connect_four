class Game 
  attr_reader :board
  def initialize
    @board = nil
    start_game
  end

  def start_game
    # Beginning of program
    # welcome message 
    puts welcome_message 
    # Add print laterChoice player quit or start
    # create the board, and generate layout
    @board = Board.new
  end


  def welcome_message
    "Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit."
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
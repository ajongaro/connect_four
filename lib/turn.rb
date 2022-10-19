

class Turn
  attr_reader :selected_column
  def initialize(selected_column, board)
    @selected_column = selected_column
    @board = board
  end

  def valid_column?
    @board.header.include?(@selected_column)
  end
end


# FLOW
# checks if column is valid (A - G) && slot_1  
# algo checks what the lowest available slot is in col
# inserts player token (via .add method) to that slot
# evaluate for win
# evaluate for tie

# ATTRIBUTES
# Selected Column
# Player? (computer or player)

# IF COMPUTER TURN
# Computer selects a random column
# checks if column is valid
# Drops token if valid
# Tries another space
# drops in appropriate space   


# DONE
# player selects a column by letter

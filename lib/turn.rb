class Turn
  attr_reader :selected_column
  def initialize(selected_column, board)
    @selected_column = selected_column
    @board = board
  end

  def valid_column?
    @board.test_column(@selected_column) &&
    @board.layout["#{@selected_column}#{'1'}".to_sym].available
  end

  def drop_token(selected_column, player_token)
    key_input = 6.downto(1).map do |number|
      "#{selected_column}#{number}".to_sym
    end

    @board.layout.reverse_each do |key, value|
      if key_input.include?(key) && value.available
        value.add(player_token)
        break
      end
    end
  end
end




# FLOW
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
# checks if column is valid (A - G) && slot_1  

class Turn
  attr_reader :selected_column
  def initialize(selected_column, board)
    @selected_column = selected_column
    @board = board
  end

  def valid_column?
    return true if @board.header.include?(@selected_column) &&
    @board.layout["#{@selected_column}#{'1'}".to_sym].available == true
    false
  end

  def drop_token(selected_column, player_token)
    a_column_keys = [:A6, :A5, :A4, :A3, :A2, :A1]
    b_column_keys = [:B6, :B5, :B4, :B3, :B2, :B1]
    c_column_keys = [:C6, :C5, :C4, :C3, :C2, :C1]
    d_column_keys = [:D6, :D5, :D4, :D3, :D2, :D1]
    e_column_keys = [:E6, :E5, :E4, :E3, :E2, :E1]
    f_column_keys = [:F6, :F5, :F4, :F3, :F2, :F1]
    g_column_keys = [:G6, :G5, :G4, :G3, :G2, :G1]

    if selected_column == "A"  then key_input = a_column_keys
    elsif selected_column == "B"  then key_input = b_column_keys
    elsif selected_column == "C"  then key_input = c_column_keys
    elsif selected_column == "D"  then key_input = d_column_keys
    elsif selected_column == "E"  then key_input = e_column_keys
    elsif selected_column == "F"  then key_input = f_column_keys
    elsif selected_column == "G"  then key_input = g_column_keys
    end

    @board.layout.reverse_each do |key, value|
      if key_input.include?(key) && value.available == true
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

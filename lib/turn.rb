class Turn
  attr_reader :selected_column
  
  def initialize(selected_column, board)
    @selected_column = selected_column
    @board = board
  end

  def valid_column?
    return false if @selected_column.empty?
    @board.test_column(@selected_column)
  end

  def drop_token(selected_column, player_token)
    key_input = 6.downto(1).map do |number|
      "#{selected_column}#{number}".to_sym
    end

    @board.layout.reverse_each do |key, value|
      if key_input.include?(key) && value == "."
        @board.layout[key] = player_token
        break
      end
    end
  end
end
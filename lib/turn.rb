class Turn
  attr_reader :selected_column
  def initialize(selected_column, board)
    @selected_column = selected_column
    @board = board
  end

  def valid_column?
    @board.test_column(@selected_column)
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
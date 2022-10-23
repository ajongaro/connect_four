require './lib/board'
require './lib/turn'
class Game 
  attr_reader :board

  def initialize
    @board = Board.new # remove this from here and generate new board in new_board
  end

  def new_board 
    @board = Board.new
  end

  def print_board
    print @board.pretty_print
  end

  def welcome_message
    "Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit."
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
      puts "Everyone quits, eventually..."
    end
  end

  def player_prompt
    print "Please select a column: "

    column_selection = gets.chomp.upcase
    puts "\n"
    turn = Turn.new(column_selection, @board)

    if turn.valid_column?
      turn.drop_token(column_selection, "X") 
    else
      puts "Please make a valid selection"
      player_prompt
    end
  end

  def computer_turn
    column = @board.random_column 
    turn = Turn.new(column, @board)

    if @board.test_column(column)
      turn.drop_token(column, "O")
    else
      computer_turn
    end
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
end
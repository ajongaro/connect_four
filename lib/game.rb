require './lib/board'
require './lib/turn'
require './lib/record'

class Game
  attr_reader :board

  def initialize
    @record = Record.new
    new_board
  end

  def new_board
    @board = Board.new
  end

  def print_board
    print @board.pretty_print
  end

  def welcome_message
    "Welcome to CONNECT FOUR\n#{puts "-" * 33}\nEnter 'p' to play. Enter 'h' for Hall of Fame. Enter 'q' to quit."
  end

  def main_menu_prompt
    puts welcome_message
    input = gets.chomp
    puts "\n"
    if input.downcase == "q"
      quit_game
    elsif input.downcase == "h"
      @record.display_hof
      puts "\n"
      main_menu_prompt
    elsif input.downcase == "p"
      two_player_prompt
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

  def two_player_prompt
    puts "#{puts "-" * 33}Select number of human players: '1' or '2' and press Enter,\nor select 'back' to return to main menu"
    input = gets.chomp
    if input == "1"
      game_play
    elsif input == "2"
      @player_1_token = "X"
      @player_2_token = "O"
      two_player_names
    elsif input == "back"
      main_menu_prompt
    else
      puts "Invalid selection.\n\n"
      two_player_prompt
    end
  end

  def two_player_names
    puts "#{puts "-" * 33}Player 1 please input name and press Enter"
    @name_1 = gets.chomp
    second_name_choice
  end

  def second_name_choice
    puts "#{puts "-" * 33}Player 2 please input name and press Enter"
    name_choice = gets.chomp
    if name_choice != @name_1
      @name_2 = name_choice
    else
      puts "Please select a different player name"
      second_name_choice
    end
    puts "#{@name_1} goes first, and will place X, #{@name_2} will go second and place O"
    two_player_gameplay
  end

  def player_prompt(token = "X")
    puts "Please select a column:"

    column_selection = gets.chomp.upcase
    puts "\n"
    turn = Turn.new(column_selection, @board)

    if turn.valid_column?
      turn.drop_token(column_selection, token)
    else
      puts "Please make a valid selection"
      player_prompt(token)
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
    puts "-" * 33
    print_board
    puts "You go first and will place X"
    until @board.winner?
      puts "\n"
      player_prompt
      if @board.winner?
        print_board
        puts "\nYou Win!\n\n"
        new_board
        return two_player_prompt
      elsif @board.tie?
        two_player_tie_end
      end

      computer_turn

      if @board.winner?
        print_board
        puts "\nYou Lose!\n\n"
        new_board
        return two_player_prompt
      elsif @board.tie?
        two_player_tie_end
      end
      print_board
    end
  end

  def two_player_gameplay
    until @board.winner?
      puts "\n"
      turn_count = 1
      player_turn(turn_count)
      break
    end
  end

  def player_turn(turn_count)
    print_board
    if turn_count.odd?
      puts "-" * 33
      puts "#{@name_1} - 'X'"
      player_prompt
        if @board.winner?
          two_player_winner_end(turn_count)
        elsif @board.tie?
          two_player_tie_end
        else
          turn_count += 1
          player_turn(turn_count)
        end
      else
      puts "-" * 33
      puts "#{@name_2} - 'O'"
      player_prompt("O")
        if @board.winner?
          two_player_winner_end(turn_count)
        elsif @board.tie?
          two_player_tie_end
        else
          turn_count += 1
          player_turn(turn_count)
        end
    end
  end

  def winning_player(turn_count)
    if turn_count.odd?
      @record.add_result_for(@name_1,"win")
      @record.add_result_for(@name_2,"lose")
      @record.write_file
      @name_1
    else
      @record.add_result_for(@name_1,"lose")
      @record.add_result_for(@name_2,"win")
      @record.write_file
      @name_2
    end
  end

  def two_player_winner_end(turn_count)
    print_board
    puts "\n#{winning_player(turn_count)} wins!"
    new_board
    two_player_prompt
  end

  def two_player_tie_end
    print_board
    @record.add_result_for(@name_1,"tie")
    @record.add_result_for(@name_2,"tie")
    @record.write_file
    puts "\nTie Game!\n\n"
    new_board
    two_player_prompt
  end
end
require 'CSV'

class Record
  attr_reader :file, :hall_of_fame

  def initialize
    @rows = CSV.read("./assets/record.csv")
    @hall_of_fame = []
  end

  def printer 
    print "#{@rows}\n\n"
  end
  
  def player_exists?(name)
    @rows.each do |row|
      return true if row[0].downcase == name.downcase
    end
    false
  end 
 
  def generate_hof 
    @hall_of_fame.clear
    @rows.each do |row|
      total_games = (row[1].to_i + row[2].to_i + row[3].to_i)
      percentage = ((row[1].to_f / total_games) * 100).round(2)
      @hall_of_fame << [row[0],percentage.to_s]
    end
    @hall_of_fame.sort_by! {|k| -k[1].to_f}
  end 
 
  def display_hof
    generate_hof
    if @hall_of_fame == []
      puts "~-~ CONNECT FOUR HALL OF FAME ~-~"
      puts "-" * 33
      puts "No Entries... yet."
    else
      top_3 = @hall_of_fame.sort_by {|k| -k[1].to_f}
      puts "~-~ CONNECT FOUR HALL OF FAME ~-~"
      puts "-" * 33
      top_3[0..2].each do |line|
        puts "#{line[0]}...#{line[1]}%"
      end
    end
  end
  
  def add_result_for(player, result)
    if player_exists?(player)
      update_record(player, result)
    else
      add_record(player, result)
    end
  end

  def add_record(player, result)
    if result == "win"
      array = [player,"1","0","0"]
    elsif result == "lose"
      array = [player,"0","1","0"]
    elsif result == "tie"
      array = [player,"0","0","1"]
    end
    @rows << array
  end

  def update_record(player, result)
    @rows.each do |row|
      if row[0] == player && result == "win"
        row[1] = (row[1].to_i + 1).to_s
      elsif row[0] == player && result == "lose"
        row[2] = (row[2].to_i + 1).to_s
      elsif row[0] == player && result == "tie"
        row[3] = (row[3].to_i + 1).to_s
      end
    end
  end

  def write_file
    CSV.open("./assets/record.csv", "wb") do |csv|
      @rows.each do |row|
        csv << row
      end
    end
  end

  def wipe_file
    CSV.open("./assets/record.csv", "wb") do |csv|
      csv << []
    end
  end
end

# remember to call write_file at the end of the game?

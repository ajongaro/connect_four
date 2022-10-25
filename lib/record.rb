
class Record
  attr_reader :file, :records

  def initialize
    @file = File.open("./assets/record.txt")
    @records = []
  end

  def print_records
    File.foreach(@file) do |line|
      record_line = line.split(",")
      @records << record_line
    end
    @records
  end
end



# player_name,games_started,wins,losses
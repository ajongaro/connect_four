
class Record
  attr_reader :file

  def initialize
    @file = File.open("./assets/record.txt")
  end
end
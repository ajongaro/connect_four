require './lib/record'

RSpec.describe Record do
  describe '#initialize' do
    it 'exists' do
      record = Record.new
    end

    it 'loads record.txt' do 
      record = Record.new
      expect(record.file).to be_a(File)
    end
  end
  
  describe '#display_results' do
    it 'prints file line by line' do
      record = Record.new
      record.print_records

      expect(record.records[0]).to eq(["player_name", "games_started", "wins", "losses"])
    end
  end

  describe '#add_record' do
    it 'adds a line to the record' do
      record = Record.new
      record.add_record("Anthony", 0, 1)

      expect(record.records[1]).to eq(["Anthony", 1, 0, 1])
    end
  end
end

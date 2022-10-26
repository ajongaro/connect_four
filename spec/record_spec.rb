require './lib/record'

RSpec.describe Record do
  describe '#initialize' do
    it 'exists' do
      record = Record.new
    end

    xit 'loads record.txt' do 
      record = Record.new
      expect(record.file).to be_a(File)
    end
  end
  
  describe '#parse' do
    xit 'populates data with csv as array' do
      record = Record.new
      record.parse

      expect(record.data[0]).to eq(["player_name", "games_started", "wins", "losses"])
    end
  end

  describe '#player_exists?' do 
    xit 'checks to see if player exists' do
      record = Record.new
      record.parse

      expect(record.player_exists?("Anthony")).to be true
    end
  end

  describe '#printer' do
    xit 'prints' do
      record = Record.new
      record.printer
      record.update_record("Brady","win")
      record.printer
    end
  end

  describe '#delete' do
    xit 'adds a line to the record' do
      record = Record.new
      
      expect(record.data[1]).to eq("Anthony", "1", "1", "0")
    end
  end
end

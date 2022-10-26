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
  
  describe '#parse' do
    it 'populates data with csv as array' do
      record = Record.new

      expect(record.data[0]).to eq(["player_name", "games_started", "wins", "losses"])
    end
  end

  describe '#player_exists?' do 
    it 'checks to see if player exists' do
      record = Record.new
        
      expect(record.player_exists?("Anthony")).to be true
    end
  end

  describe '#printer' do
    it 'prints' do
      record = Record.new
    end
  end

  describe '#delete' do
    it 'adds a line to the record' do
      record = Record.new
      
    end
  end
end

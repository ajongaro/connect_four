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
end
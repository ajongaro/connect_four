require './lib/board'
require './lib/space'
require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      turn = Turn.new("A")

      expect(turn).to be_a(Turn)
    end
    
    it 'has a column selection' do
      turn = Turn.new("A")
      
      expect(turn.selected_column).to eq('A')
    end

  end

  
end
require './lib/board'
require './lib/space'
require './lib/turn'

RSpec.describe Turn do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'exists' do
      turn = Turn.new("A", board)

      expect(turn).to be_a(Turn)
    end
    
    it 'has a column selection' do
      turn = Turn.new("A", board)
      
      expect(turn.selected_column).to eq('A')
    end
  end

  describe '#valid_column?' do
    it 'checks to see if column exists' do
      turn = Turn.new("A", board)

      expect(turn.valid_column?).to be true
    end

    it 'checks to see if column has available slot' do
      turn = Turn.new("A", board)

      expect(turn.valid_column?).to be true

      board.layout[:A1].add("X")
      expect(turn.valid_column?).to be false
    end
  end
end
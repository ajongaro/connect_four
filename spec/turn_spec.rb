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

    it 'returns false if column does not exist' do
      turn = Turn.new("U", board)

      expect(turn.valid_column?).to be false
    end
  end
  
  describe 'add token method' do
    it 'adds a token to the lowest available space in the column' do
      turn = Turn.new("A", board)
      turn.drop_token("A", "X")

      expect(board.layout[:A6].slot).to eq("X")

      turn_2 = Turn.new("A", board)
      turn.drop_token("A", "O")
      
      expect(board.layout[:A5].slot).to eq("O")
      expect(board.layout[:A6].slot).to eq("X")
    end
  end
end
require './lib/space'
require './lib/board'

RSpec.describe Board do
  describe "#initialize" do  
    let(:board) { Board.new }

    it 'exists' do
      expect(board).to be_a(Board)
    end
    
    it 'creates a hash' do
      expect(board.layout).to be_a(Hash) 
    end
   
    it 'builds a hash with 42 board positions as keys' do
      keys_test = board.layout.count
      
      expect(keys_test).to eq(42)
    end

    it 'builds a hash with correct key IDs, A-G, 1-6' do
      board.create_layout
      key_expected = [:A1, :A2, :A3, :A4, :A5, :A6, :B1, :B2, :B3, :B4, :B5, :B6, :C1, :C2, :C3, :C4, :C5, :C6, :D1, :D2, :D3, :D4, :D5, :D6, :E1, :E2, :E3, :E4, :E5, :E6, :F1, :F2, :F3, :F4, :F5, :F6, :G1, :G2, :G3, :G4, :G5, :G6]

      expect(board.layout.keys).to eq(key_expected)
    end

    it 'builds a hash with the correct key values .' do 
      board.create_layout
      values_output = board.layout.values.map(&:slot)
      values_expected = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]

      expect(values_output).to eq(values_expected)
    end

    it 'prints a pretty board' do
      board.create_layout
      pretty_board = "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n......."
      
      expect(board.display_board).to eq(pretty_board)
    end
  end
end




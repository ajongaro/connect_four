require './lib/board'

RSpec.describe Board do
  let(:board) { Board.new }
  describe "#initialize" do  
    it 'exists' do
      expect(board).to be_a(Board)
    end
  end

  describe '#create_layout' do
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
      values_output = board.layout.values
      values_expected = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]

      expect(values_output).to eq(values_expected)
    end
  end

  describe '#pretty_print' do
    it 'prints a pretty board' do
      board.create_layout
      pretty_board = "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n"

      expect(board.pretty_print).to eq(pretty_board)
    end
  end

  describe '#winner?' do
    it 'returns false with no pieces played' do
      board.create_layout
      
      expect(board.winner?).to be false
    end

    it 'returns true with 4 pieces horizontally' do
      board.create_layout

      board.layout[:A1] = "X"
      board.layout[:B1] = "X"
      board.layout[:C1] = "X"
      board.layout[:D1] = "X"
      
      expect(board.winner?).to be true
    end

    it 'returns true with 4 pieces vertically' do 
      board.create_layout 
      board.layout[:G5] = "O"
      board.layout[:G4] = "O"
      board.layout[:G3] = "O"
      board.layout[:G2] = "O"
       
      expect(board.winner?).to be true
    end

    it 'returns true with 4 pieces diagonally' do
      board.create_layout 
      board.layout[:G5] = "O"
      board.layout[:F4] = "O"
      board.layout[:E3] = "O"
      board.layout[:D2] = "O"

      expect(board.winner?).to be true
    end
  end

  describe '#tie?' do
    it 'returns true if all slots are occupied and no winner' do
      board.create_layout

      x_array = [:A1, :A2, :A3, :B4, :B5, :B6, :C1, :C2, :C3, :D4, :D5, :D6, :E1, :E2, :E3, :F4, :F5, :F6, :G1, :G2, :G3]  
     
      board.layout.each do |key,value|
        if x_array.include? key
          board.layout[key] = "X"
        else
          board.layout[key] = "O"
        end
      end

      expect(board.tie?).to be true 
    end
  end

  describe 'test_column' do
    it 'checks top row of column for space to change value' do
      board.layout[:A6] = "X"
      board.layout[:A5] = "X"
      board.layout[:A4] = "X"
      board.layout[:A3] = "X"
      board.layout[:A2] = "X"
      board.layout[:A1] = "X"

      expect(board.test_column("A")).to eq(false)
    end

    it 'returns true when top row of column is empty' do
      board.layout[:G6] = "X"
      board.layout[:G5] = "X"
      board.layout[:G4] = "X"
      board.layout[:G3] = "X"
      board.layout[:G2] = "X"

      expect(board.test_column("G")).to eq(true)
    end
  end

  describe 'combine method' do
    it 'finds either the next or previous letter alphabetically depending on argument' do
      expect(board.combine("C", "up")).to eq("D")
      expect(board.combine("G", "down")).to eq("F")
    end
  end

  describe 'generate_diagonal_array' do
    it 'creates an array with the values present along a diagonal and puts into storage' do
      board.layout[:A6] = "X"
      board.layout[:B5] = "O"
      board.layout[:C4] = "."
      board.layout[:D3] = "X"
      board.layout[:E2] = "."
      board.layout[:F1] = "O"
      board.generate_diagonal_array(:A6, "up")

      expect(board.diag_array).to eq(["X", "O", ".", "X", ".", "O", "NOPE"])
    end
  end

  describe 'diagonal_win' do
    it 'can find diagonal win conditions up and to the right' do
      board.layout[:B6] = "O"
      board.layout[:C5] = "X"
      board.layout[:D4] = "X"
      board.layout[:E3] = "X"
      board.layout[:F2] = "X"

      expect(board.diagonal_win).to be true

    end

    it 'can find diagonal win conditions up and to the left' do
      board.layout[:G5] = "O"
      board.layout[:F4] = "O"
      board.layout[:E3] = "O"
      board.layout[:D2] = "O"

      expect(board.diagonal_win).to be true
    end
  end
end






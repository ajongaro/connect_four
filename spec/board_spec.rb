require './lib/space'
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
      values_output = board.layout.values.map(&:slot)
      values_expected = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]

      expect(values_output).to eq(values_expected)
    end
  end

  describe '#display_board' do
    it 'prints a pretty board' do
      board.create_layout
      pretty_board = "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n......."
      
      expect(board.display_board).to eq(pretty_board)
    end
  end

  describe '#rows' do
    it 'has access to the values in row 1' do
      board.create_layout

      expect(board.row_1).to eq('.......')
    end

    it 'has access to the values in row 2' do
      board.create_layout

      expect(board.row_2).to eq('.......')
    end

    it 'has access to the values in row 3' do
      board.create_layout

      expect(board.row_3).to eq('.......')
    end

    it 'has access to the values in row 4' do
      board.create_layout

      expect(board.row_4).to eq('.......')
    end

    it 'has access to the values in row 5' do
      board.create_layout

      expect(board.row_5).to eq('.......')
    end

    it 'has access to the values in row 6' do
      board.create_layout

      expect(board.row_6).to eq('.......')
    end
  end

  describe '#columns' do
    it 'has access to the values in column A' do
      board.create_layout

      expect(board.column_A).to eq('......')
    end

    it 'has access to the values in column B' do
      board.create_layout

      expect(board.column_B).to eq('......')
    end

    it 'has access to the values in column C' do
      board.create_layout

      expect(board.column_C).to eq('......')
    end

    it 'has access to the values in column D' do
      board.create_layout

      expect(board.column_D).to eq('......')
    end

    it 'has access to the values in column E' do
      board.create_layout

      expect(board.column_E).to eq('......')
    end

    it 'has access to the values in column F' do
      board.create_layout

      expect(board.column_F).to eq('......')
    end

    it 'has access to the values in column G' do
      board.create_layout

      expect(board.column_G).to eq('......')
    end
  end

  describe '#diagonals' do
    it 'has access to the first diagonal from left' do
      board.create_layout

      expect(board.diag_1).to eq('....')
    end

    it 'has access to the second diagonal from left' do
      board.create_layout

      expect(board.diag_2).to eq('.....')
    end

    it 'has access to the third diagonal from left' do
      board.create_layout

      expect(board.diag_3).to eq('......')
    end

    it 'has access to the fourth diagonal from left' do
      board.create_layout

      expect(board.diag_4).to eq('......')
    end

    it 'has access to the fifth diagonal from left' do
      board.create_layout

      expect(board.diag_5).to eq('.....')
    end

    it 'has access to the sixth diagonal from left' do
      board.create_layout

      expect(board.diag_6).to eq('....')
    end

    it 'has access to the first diagonal from right' do
      board.create_layout

      expect(board.diag_7).to eq('....')
    end

    it 'has access to the second diagonal from right' do
      board.create_layout

      expect(board.diag_8).to eq('.....')
    end

    it 'has access to the third diagonal from right' do
      board.create_layout

      expect(board.diag_9).to eq('......')
    end

    it 'has access to the fourth diagonal from right' do
      board.create_layout

      expect(board.diag_10).to eq('......')
    end

    it 'has access to the fifth diagonal from right' do
      board.create_layout

      expect(board.diag_11).to eq('.....')
    end

    it 'has access to the sixth diagonal from right' do
      board.create_layout

      expect(board.diag_12).to eq('....')
    end
  end

  describe '#winner?' do
    it 'returns false with no pieces played' do
      board.create_layout
      
      expect(board.winner?).to be false
    end

    it 'returns true with 4 pieces in a _row_' do
      board.create_layout

      board.layout[:A1].add("X")
      board.layout[:B1].add("X")
      board.layout[:C1].add("X")
      board.layout[:D1].add("X")
      
      expect(board.winner?).to be true
    end
  end

  describe '#tie?' do
    it 'returns true if all slots are occupied and no winner' do
      board.create_layout

      x_array = [:A1, :A2, :A3, :B4, :B5, :B6, :C1, :C2, :C3, :D4, :D5, :D6, :E1, :E2, :E3, :F4, :F5, :F6, :G1, :G2, :G3]  
     
      board.layout.each do |key,value|
        if x_array.include? key
          value.add("X")
        else
          value.add("O")
        end
      end

      expect(board.tie?).to be true 
    end
  end
end





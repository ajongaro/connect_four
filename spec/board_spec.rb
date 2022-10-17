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

  end

end




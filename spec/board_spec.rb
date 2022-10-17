require './lib/board'

RSpec.describe Board do
  describe "#initialize" do  
    let(:board) { Board.new }

    it 'exists' do
      expect(board).to be_a(Board)
    end
    
    it 'contains a hash' do
      expect(board.layout).to be_a(Hash) 
    end
  end

end




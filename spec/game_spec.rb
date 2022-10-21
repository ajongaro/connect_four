require './lib/game'
require './lib/board'
require './lib/turn'

RSpec.describe Game do
  let(:game) { Game.new }
  describe '#initialize' do
    it 'exists' do
      expect(game).to be_a(Game) 
    end
    
    it 'creates a board' do
      expect(game.board).to be_a(Board)    
    end
  
    it 'creates a board layout' do
      expect(game.board.layout).to be_a(Hash)
      expect(game.board.layout[:A1]).to be_a(Space)
    end
  end
end
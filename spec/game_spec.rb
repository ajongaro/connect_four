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
      game.start_game

      expect(game.board).to be_a(Board)    
    end
  
    it 'creates a board layout' do
      game.start_game

      expect(game.board.layout).to be_a(Hash)
      expect(game.board.layout[:A1]).to be_a(Space)
    end
  end

  describe '#start_game' do
    describe '#welcome_message' do
      it 'prints out welcome message' do
        expect(game.welcome_message).to eq("Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit.")
      end
    end
  end
end
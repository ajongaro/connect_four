require './lib/game'

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

  describe '#start_game' do
    describe '#welcome_message' do
      it 'prints out welcome message' do
        expect(game.welcome_message).to eq("Welcome to CONNECT FOUR\nEnter 'p' to play. Enter 'q' to quit.")
      end
    end
    
    describe '#prompt_for_input' do
      # we can't test gets.chomp
    end
  end

  describe 'player_turn' do
    xit 'prompts player for column selection' do
      expect(game.player_prompt).to eq("Please Select a Column: 'ABCDEFG'")
    end

  end
end
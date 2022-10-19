require './lib/board'
require './lib/space'
require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      turn = Turn.new

      expect(turn).to be_a(Turn)
    end
  end
end
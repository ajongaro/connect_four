require './lib/space'
RSpec.describe Space do
  describe '#initialize' do
    it 'exists' do
      space = Space.new
      expect(space).to be_a(Space)
    end

    it 'has a slot' do
      space = Space.new
      expect(space.slot).to eq(".")
    end

    it 'starts available when created' do
      space = Space.new
      expect(space.available).to be(true)
    end

    it 'has the ability to change whats in the slot' do
      space = Space.new
      space.add('X')
      expect(space.slot).to eq("X")
    end

    it 'cannot be changed after a token is added' do
      space = Space.new
      space.add('X')
      space.add('O')
      expect(space.slot).to eq("X")
    end

    it 'changes availability after a token is added' do
      space = Space.new
      space.add('X')
      expect(space.available).to be(false)
    end



end
end
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

    it 'has the ability to change whats in the slot' do
      space = Space.new
      space.fill('X')
      expect(space.slot).to eq("X")
    end



end
end
class Space
  attr_reader :slot

  def initialize
    @slot = "."
  end

  def fill(token)
    @slot = token
  end
end
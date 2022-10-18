class Space
  attr_reader :slot, :available

  def initialize
    @slot = "."
    @available = true
  end

  def add(token)
    return if !@available
    @slot = token 
    @available = false
  end


end


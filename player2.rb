class Player2 < Player
  attr_accessor :name

  def initialize(name)
    @shot = 'X'
    super
  end
end

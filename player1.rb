class Player1 < Player
  attr_accessor :name

  def initialize(name)
    @shot = 'O'
    super
  end
end

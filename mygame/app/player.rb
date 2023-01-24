class Player
  attr_sprite
  attr_accessor :speed

  def initialize(x, y)
    @x = x
    @y = y
    @w = 100
    @h = 80
    @path = 'sprites/misc/dragon-0.png'
    @speed = 2
  end
end

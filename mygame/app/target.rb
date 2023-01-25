class Target
  attr_sprite
  attr_accessor :dead

  def initialize(grid_height, grid_width)
    # 64 could be a varialbe, size
    @x = rand(grid_width * 0.4) + (grid_width * 0.6)
    @y = rand(grid_height - 64 * 2) + 64
    @w = 64
    @h = 64
    @path = 'sprites/target.png'
    @dead = false
  end
end

class Player
  attr_sprite
  attr_accessor :speed, :fireball_speed, :dead

  def initialize(x, y)
    @x = x
    @y = y
    @w = 100
    @h = 80
    @path = 'sprites/misc/dragon-0.png'
    @fireball_speed = 8
    @speed = 10
    @dead = false
  end

  def move(keyboard, grid_h, grid_w)
    # player movement
    if keyboard.left
      @x -= @speed
    elsif keyboard.right
      @x += @speed
    elsif keyboard.down
      @y -= @speed
    elsif keyboard.up
      @y += @speed
    end

    player_sprite_index = 0.frame_index(count: 6, hold_for: 8, repeat: true)
    @path = "sprites/misc/dragon-#{player_sprite_index}.png"

    check_boundaries(grid_h, grid_w)
  end

  def check_boundaries(grid_h, grid_w)
    check_x_border(grid_w)
    check_y_border(grid_h)
  end

  def check_x_border(grid_w)
    @x + @w > grid_w && @x = grid_w - @w
    @x.negative? && @x = 0
  end

  def check_y_border(grid_h)
    @y + @h > grid_h && @y = grid_h - @h
    @y.negative? && @y = 0
  end
end

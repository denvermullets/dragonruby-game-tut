class MyGame
  # game specific attr methods
  attr_gtk
  attr_reader :player

  def initialize(args)
    @player = {
      x: args.grid.w / 2,
      y: args.grid.y / 2,
      w: 20,
      h: 20
    }
  end

  def tick
    if keyboard.left
      player.x -= 10
    elsif keyboard.right
      player.x += 10
    elsif keyboard.down
      player.y -= 10
    elsif keyboard.up
      player.y += 10
    end
  end
end
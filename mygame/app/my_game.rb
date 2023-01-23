require 'app/player.rb'

class MyGame
  # game specific attr methods
  attr_gtk
  attr_reader :player

  def initialize(args)
    @player = Player.new(
      args.grid.w / 2, args.grid.h / 2
    )
  end

  def tick
    handle_input
    render
  end

  def handle_input
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

  def render
    # x, y, w, h, source
    outputs.sprites << {
      x: player.x,
      y: player.y,
      w: player.w,
      h: player.h,
      path: 'sprites/misc/dragon-0.png'
    }
  end
end

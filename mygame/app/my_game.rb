require 'app/player.rb'

class MyGame
  # deconstructs game specific attr methods
  attr_gtk
  attr_reader :player

  def initialize(args)
    @player = Player.new(
      args.grid.w / 2, args.grid.h / 2
    )
  end

  def tick
    args.state.fireballs ||= []

    handle_input
    render
  end

  def handle_input
    player_movement
    shoot_fireball
  end

  def player_movement
    # player_movement and boundary checks could be moved to module/service object
    if keyboard.left
      player.x -= 10
    elsif keyboard.right
      player.x += 10
    elsif keyboard.down
      player.y -= 10
    elsif keyboard.up
      player.y += 10
    end

    check_boundaries
  end

  def shoot_fireball
    # unsure if ultimately this _should_ be inside Player, but leaving it outside for now
    return unless keyboard.key_down.z || keyboard.key_down.j || inputs.controller_one.key_down.a

    state.fireballs << {
      w: 32,
      h: 32,
      x: player.x,
      y: player.y,
      path: 'sprites/fireball.png'
    }
  end

  def check_boundaries
    check_x_border
    check_y_border
  end

  def check_x_border
    player.x + player.w > grid.w && player.x = grid.w - player.w
    player.x.negative? && player.x = 0
  end

  def check_y_border
    player.y + player.h > grid.h && player.y = grid.h - player.h
    player.y.negative? && player.y = 0
  end

  def move_fireball
    state.fireballs.each do |fireball|
      fireball.x += player.speed
    end
  end

  def render
    move_fireball
    outputs.sprites << [player, state.fireballs]
  end
end

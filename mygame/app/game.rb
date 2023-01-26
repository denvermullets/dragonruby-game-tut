require 'app/player.rb'
require 'app/target.rb'

class Game
  # deconstructs game specific attr methods
  attr_gtk
  attr_reader :player

  def initialize(args)
    @player = Player.new(
      args.grid.w / 2, args.grid.h / 2
    )
    @speed = player.speed
  end

  def tick
    state.fireballs ||= []
    state.targets ||= [
      Target.new(grid.h, grid.w),
      Target.new(grid.h, grid.w),
      Target.new(grid.h, grid.w)
    ]
    state.score ||= 0

    handle_input
    render
  end

  def render
    move_fireball
    outputs.sprites << [player, state.fireballs, state.targets]
    outputs.labels << {
      x: 40,
      y: grid.h - 40,
      text: "Score: #{state.score}",
      size_enum: 4
    }
  end

  ####
  # rest of methods that could be abstracted
  ####

  def handle_input
    player.move(keyboard, grid.h, grid.w)
    shoot_fireball
  end

  def shoot_fireball
    # unsure if ultimately this _should_ be inside Player or its own class, but leaving it outside for now
    return unless keyboard.key_down.z || keyboard.key_down.j || inputs.controller_one.key_down.a

    state.fireballs << {
      w: 32,
      h: 32,
      x: player.x,
      y: player.y,
      path: 'sprites/fireball.png'
    }

    state.score -= state.score.zero? ? 0 : 1
  end

  def move_fireball
    state.fireballs.each do |fireball|
      fireball.x += player.fireball_speed

      target_collision(fireball)
      state.fireballs.reject!(&:dead)
      state.targets.reject!(&:dead)

      # TODO: investigate why fireball jitters when immediately removed at grid.w, adding pixels helps(?)
      fireball.x > (grid.w + 200) && fireball.dead = true
    end
  end

  def target_collision(fireball)
    state.targets.each do |target|
      next unless geometry.intersect_rect?(target, fireball)

      target.dead = true
      fireball.dead = true
      state.score += 2
      state.targets << Target.new(grid.h, grid.w)
    end
  end
end

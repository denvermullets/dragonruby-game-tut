require 'app/my_game.rb'

def tick(args)
  # args.state.player ||= {
  #   x: args.grid.w / 2,
  #   y: args.grid.h / 2,
  #   w: 20,
  #   h: 20
  # }

  # speed = 12

  # if args.inputs.left
  #   args.state.player.x -= speed
  # elsif args.inputs.right
  #   args.state.player.x += speed
  # elsif args.inputs.down
  #   args.state.player.y -= speed
  # elsif args.inputs.up
  #   args.state.player.y += speed
  # end

  # args.outputs.sprites << [
  #   args.state.player.x,
  #   args.state.player.y,
  #   100,
  #   80,
  #   'sprites/misc/dragon-0.png'
  # ]
  $my_game ||= MyGame.new(args)
  $my_game.args = args
  $my_game.tick


end

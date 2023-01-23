def tick(args)
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  # args.state.player ||= {
  #   x: args.grid.w / 2,
  #   y: args.grid.h / 2,
  #   w: 20,
  #   h: 20
  # }

  speed = 12

  player_w = 100
  player_h = 80

  if args.inputs.left
    args.state.player_x -= speed
  elsif args.inputs.right
    args.state.player_x += speed
  end

  if args.inputs.up
    args.state.player_y += speed
  elsif args.inputs.down
    args.state.player_y -= speed
  end

  # part of keeping the sprite within boundaries of the window
  args.state.player_x + player_w > args.grid.w && args.state.player_x = args.grid.w - player_w
  args.state.player_x.negative? && args.state.player_x = 0

  args.state.player_y + player_h > args.grid.h && args.state.player_y = args.grid.h - player_h
  args.state.player_y.negative? && args.state.player_y = 0

  # Move player based on keyboard input
  # if args.inputs.left
  #   args.state.player.x -= speed
  # elsif args.inputs.right
  #   args.state.player.x += speed
  # elsif args.inputs.down
  #   args.state.player.y -= speed
  # elsif args.inputs.up
  #   args.state.player.y += speed
  # end

  args.outputs.sprites << [
    args.state.player_x,
    args.state.player_y,
    100,
    80,
    'sprites/misc/dragon-0.png'
  ]
end

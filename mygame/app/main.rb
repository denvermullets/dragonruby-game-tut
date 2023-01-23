require 'app/my_game.rb'

def tick(args)
  $my_game ||= MyGame.new(args)
  $my_game.args = args
  $my_game.tick
end

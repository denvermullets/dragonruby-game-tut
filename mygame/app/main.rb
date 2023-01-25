require 'app/game.rb'

def tick(args)
  $game ||= Game.new(args)
  $game.args = args
  $game.tick
end

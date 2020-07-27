require_relative 'players'
require_relative 'game'
require_relative 'game_turn'

players1 = Players.new("moe")
players2 = Players.new("larry", 60)
players3 = Players.new("curly", 125)


knuckleheads = Game.new("Knuckleheads")
puts knuckleheads.title
knuckleheads.add_players(players1)
knuckleheads.add_players(players2)
knuckleheads.add_players(players3)

knuckleheads.play(3)
knuckleheads.print_stats
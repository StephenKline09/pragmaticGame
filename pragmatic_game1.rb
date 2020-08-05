require_relative 'players'
require_relative 'game'
require_relative 'game_turn'
require_relative 'clumsy_players'
require_relative 'berserk_players'


knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayers.new("klutz", 105)
knuckleheads.add_players(klutz)

berserker = BerserkPlayers.new("berserker", 50)
knuckleheads.add_players(berserker)

loop do
    puts "\nHow many rounds would you like to play? Or Enter 'quit'"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        knuckleheads.play(answer.to_i)
    when 'quit', 'exit'
        knuckleheads.print_stats
        break
    else
        puts "Please enter a number or 'quit'"
    end
end

knuckleheads.save_high_scores
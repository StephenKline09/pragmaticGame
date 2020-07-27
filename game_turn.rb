require_relative 'players'
require_relative 'die'

module GameTurn
    def self.take_turn(players)
        die = Die.new
        case die.roll
        when 1..2
            players.blam
        when 3..4
            puts "#{players.name} was skipped"
        else
            players.w00t
        end
    end
end

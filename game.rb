require_relative 'players'
require_relative 'die'

class Game
    attr_reader :title

    def initialize(title)
        @title = title
        @players = []
    end
    def add_players(a_player)
        @players.push(a_player)
    end
    def play
        puts "There are #{@players.size} players in #{@title}:"
        @players.each do |players|
            puts players
        end
        @players.each do |players|
            die = Die.new
            case die.roll
            when 1..2
                players.blam
            when 3..4
                puts "#{players.name} was skipped"
            else
                players.w00t
            end
            puts players
        end
    end
end
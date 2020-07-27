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
            puts players
        end
    end
end
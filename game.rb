require_relative 'players'
require_relative 'game_turn'

class Game
    attr_reader :title

    def initialize(title)
        @title = title
        @players = []
    end

    def add_players(a_player)
        @players.push(a_player)
    end

    def print_name_and_health(player)
        puts "#{player.name} (#{player.health})"
    end

    def print_stats
        puts "\n#{@title} Statistics:"
        strong_players, wimpy_players = @players.partition { |players| players.strong? }

        puts "\n#{strong_players.size} Strong Players:"
        strong_players.each do |players|
            puts "#{players.name} (#{players.health})"        
        end

        puts "\n#{wimpy_players.size} Wimpy Players:"
        wimpy_players.each do |players|
            puts "#{players.name} (#{players.health})"
        end

        puts "\n#{@title} High Scores:"
        @players.sort.each do |players|
            formatted_name = players.name.ljust(20, '.')
            puts "#{formatted_name} #{players.score}"
        end
    end

    def play(rounds)
        puts "There are #{@players.size} players in #{@title}:"
        @players.each do |players|
            puts players
        end

        1.upto(rounds) do |round|
            puts "\nRound #{round}:"
            @players.each do |players|
                GameTurn.take_turn(players)
                puts players
            end
        end
    end
end
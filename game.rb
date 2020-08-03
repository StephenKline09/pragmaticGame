require_relative 'players'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @players = []
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_players(Players.from_csv(line))
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |players|
        file.puts high_score_entry(players)
      end
    end
  end
  
  def add_players(a_player)
    @players.push(a_player)
  end
  
  def play(rounds)
    puts "There are #{@players.size} players in #{@title}: "
    
    @players.each do |players|
      puts players
    end
    
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |players|
        GameTurn.take_turn(players)
      end
    end
  end
    
  def print_name_and_health(players)
    puts "#{players.name} (#{players.health})"
  end
  
  def print_stats
    puts "\n#{@title} Statistics:"

    @players.each do |players|
        puts "\n#{players.name}'s points totals:"
        puts "#{players.points} grand total points"
        puts ""
    end
    
    strong_players, wimpy_players = @players.partition { |players| players.strong? }
    
    puts "#{strong_players.size} strong players:"
    strong_players.each do |players|
      print_name_and_health(players)
    puts ""
    end    
    
    puts "#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |players|
      print_name_and_health(players)
    end    
    
    def high_score_entry(players)
      puts ""
      formatted_name = players.name.ljust(20, '.')
      "#{formatted_name} #{players.score}"
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |players|
      puts high_score_entry(players)
      puts "\n#{players.name}'s points totals: #{players.score}"
      players.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{players.points} grand total points"
  end
end
end


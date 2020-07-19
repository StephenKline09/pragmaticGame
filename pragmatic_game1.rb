class Players
    attr_reader :health
    attr_accessor :name
 
    def name=(new_name)
        @name = new_name.capitalize
    end

    def score
        @health + @name.length
    end

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def to_s
        "#{@name} with a health of #{@health} and a score of #{score}."
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end

    def w00t
        @health += 15
        puts "#{@name} got w00ted!"
    end
end
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
        puts "There are #{players.size} players in #{@title}:"
        @players.each do |players|
            puts players
        end
    @players.each do |players|
        players.blam
        players.w00t
        puts players
    end
end


players1 = Players.new("moe")
players2 = Players.new("larry", 60)
players3 = Players.new("curly", 125)

players = [players1, players2, players3]

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_players(players1)
knuckleheads.add_players(players2)
knuckleheads.add_players(players3)
knuckleheads.play

end

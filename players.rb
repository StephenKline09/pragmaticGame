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
        "#{@name} has a health of #{@health} and a score of #{score}."
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

if __FILE__ == $0
    players = Players.new("moe")
    puts players.name
    puts players.health
    players.w00t
    puts players.health
    players.blam
    puts players.health
end

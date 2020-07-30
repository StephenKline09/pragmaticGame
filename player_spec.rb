require_relative 'players'
require_relative 'treasure_trove'

describe Players do

    before do
        @initial_health = 150
        @players = Players.new("larry", @initial_health)
    end

    it "has a capitalized name" do
        @players.name.should == "Larry"
    end

    it "has an initial health" do
        @players.health.should == 150
    end

    it "has a string representation" do
        @players.found_treasure(Treasure.new(:hammer, 50))
        @players.found_treasure(Treasure.new(:hammer, 50))

        @players.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
    end

    it "computes a score as the sum of its health and length of name" do
        @players.found_treasure(Treasure.new(:hammer, 50))
        @players.found_treasure(Treasure.new(:hammer, 50))

        @players.score.should == 250
    end

    it "increases by 15 when w00ted" do
        @players.w00t

        @players.health.should == @initial_health + 15
    end

    it "decreases health by 10 when blammed" do 
        @players.blam

        @players.health.should == @initial_health - 10
    end

    it "computes points as the sum of all treasure points" do
        @players.points.should == 0
      
        @players.found_treasure(Treasure.new(:hammer, 50))
      
        @players.points.should == 50
      
        @players.found_treasure(Treasure.new(:crowbar, 400))
      
        @players.points.should == 450
      
        @players.found_treasure(Treasure.new(:hammer, 50))
      
        @players.points.should == 500
    end

    context "created with a default health" do
        before do
          @players = Players.new("larry")
        end
        
        it "has a health of 100" do
          @players.health.should == 100
        end
    end

    context "with a health greater than 100" do
        before do 
            @players = Players.new("larry", 150)
        end
    
        it "is a beast" do
            @players.should be_strong 
        end
    end
end
    context "with a health less than 100" do
        before do 
            @players = Players.new("larry", 100)
        end

        it "is a whimp" do
        @players.should_not be_strong
    end
end

context "in a collection of players" do
    before do
      @players1 = Players.new("moe", 100)
      @players2 = Players.new("larry", 200)
      @players3 = Players.new("curly", 300)

      @players = [@players1, @players2, @players3]
    end
    
    it "is sorted by decreasing score" do
      @players.sort.should == [@players3, @players2, @players1]
    end
end


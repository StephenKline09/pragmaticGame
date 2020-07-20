require_relative 'players'

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
        @players.to_s.should == "Larry has a health of 150 and a score of 155."
    end

    it "computes a score as the sum of its health and length of name" do
        @players.score.should == (150 +5)
    end

    it "increases by 15 when w00ted" do
        @players.w00t

        @players.health.should == @initial_health + 15
    end

    it "decreases health by 10 when blammed" do 
        @players.blam

        @players.health.should == @initial_health - 10
    end

end

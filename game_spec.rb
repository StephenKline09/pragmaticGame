require_relative 'game'

describe Game do

    before do
        @game = Game.new("Knuckleheads")

        @initial_health = 100
        @players = Players.new("moe", @initial_health)

        @game.add_players(@players)
    end

    it "w00ts the player if a high number is rolled" do
        Die.any_instance.stub("roll").and_return(5)
        @game.play
    
        @players.health.should == @initial_health + 15
    end

    it "skips the player if a medium number is rolled" do
        Die.any_instance.stub("roll").and_return(3)
        @game.play

        @players.health.should == @initial_health
    end

    it "blams the player if a low number is rolled" do
        Die.any_instance.stub(:roll).and_return(1)

        @game.play

        @players.health.should == @initial_health - 10
    end
end
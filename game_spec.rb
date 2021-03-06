require_relative 'game'

describe Game do

    before do
        @game = Game.new("Knuckleheads")

        @initial_health = 100
        @players = Players.new("moe", @initial_health)

        @game.add_players(@players)
    end

    it "has a title" do
        @game.title.should == "Knuckleheads"
    end

    it "w00ts the player if a high number is rolled" do
        Die.any_instance.stub("roll").and_return(5)

        @game.play(2)
    
        @players.health.should == @initial_health + (15 * 2)
    end

    it "skips the player if a medium number is rolled" do
        Die.any_instance.stub("roll").and_return(3)

        @game.play(2)

        @players.health.should == @initial_health
    end

    it "blams the player if a low number is rolled" do
        Die.any_instance.stub(:roll).and_return(1)

        @game.play(2)

        @players.health.should == @initial_health - (10 * 2)
    end
    it "assigns a treasure for points during a player's turn" do
        game = Game.new("Knuckleheads")
        players = Players.new("moe")
      
        game.add_players(players)
      
        game.play(1)
      
        players.points.should_not be_zero      
    end
end
require_relative 'clumsy_players'

describe ClumsyPlayer do
  before do
    @players = ClumsyPlayers.new("klutz")
  end
  
  it "only gets half the point value for each treasure" do
    @players.points.should == 0

    hammer = Treasure.new(:hammer, 50)
    @players.found_treasure(hammer)
    @players.found_treasure(hammer)
    @players.found_treasure(hammer)

    @players.points.should == 75

    crowbar = Treasure.new(:crowbar, 400)
    @players.found_treasure(crowbar)
    
    @players.points.should == 275    
    
    yielded = []
    @players.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]    
  end

end
Loot = Struct.new(:name, :points)

module LootPool
    LOOT = [
        Loot.new(:coin_sack, 10),
        Loot.new(:treasure_chest, 50),
        Loot.new(:ancient_book, 100),
        Loot.new(:enchanted_armor, 150),
        Loot.new(:legendary_artifact, 200),
        Loot.new(:a_godly_weapon, 300),
    ]

    def self.random
        LOOT.sample
    end
end
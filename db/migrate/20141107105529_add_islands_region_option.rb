class AddIslandsRegionOption < ActiveRecord::Migration
  def up
    ocean = Continent.create(name: 'Ocean')
    Region.create(name: 'Island', continent: ocean, map: 'world_map.jpg')
  end

  def down
    Region.where(name: 'Island').first.delete
    Continent.where(name: 'Ocean').first.delete
  end
end

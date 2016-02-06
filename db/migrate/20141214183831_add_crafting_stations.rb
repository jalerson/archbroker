class AddCraftingStations < ActiveRecord::Migration
  def up
    category = Category.create(name: 'Private Workbench')
    type = Type.create(name: 'Private Workbench (8x8)')

    x8 = Size.where(name: '8x8').first

    Property.create(name: 'Private Leatherwork Table', plan_cost: 30, size: x8, decor_limit: nil, security_deposit: 10, taxes: 5, type: type, category: category)
    Property.create(name: 'Private Loom', plan_cost: 30, size: x8, decor_limit: nil, security_deposit: 10, taxes: 5, type: type, category: category)
    Property.create(name: 'Private Masonry Table', plan_cost: 30, size: x8, decor_limit: nil, security_deposit: 10, taxes: 5, type: type, category: category)
    Property.create(name: 'Private Sawmill', plan_cost: 30, size: x8, decor_limit: nil, security_deposit: 10, taxes: 5, type: type, category: category)
    Property.create(name: 'Private Smelter', plan_cost: 30, size: x8, decor_limit: nil, security_deposit: 10, taxes: 5, type: type, category: category)
  end

  def down
    Property.where(name: 'Private Leatherwork Table').first.delete
    Property.where(name: 'Private Loom').first.delete
    Property.where(name: 'Private Masonry Table').first.delete
    Property.where(name: 'Private Sawmill').first.delete
    Property.where(name: 'Private Smelter').first.delete

    Type.where(name: 'Crafting Station (8x8)').first.delete
    Category.where(name: 'Crafting Station').first.delete
  end
end

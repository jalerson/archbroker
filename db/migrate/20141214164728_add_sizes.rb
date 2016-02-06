class AddSizes < ActiveRecord::Migration
  def up
    Size.create(name: '8x8')
    Size.create(name: '16x16')
    Size.create(name: '24x24')
    Size.create(name: '28x28')
    Size.create(name: '44x44')
  end
  
  def down
    Size.where(name: '8x8').first.delete
    Size.where(name: '16x16').first.delete
    Size.where(name: '24x24').first.delete
    Size.where(name: '28x28').first.delete
    Size.where(name: '44x44').first.delete
  end
end

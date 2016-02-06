class AddSizeToProperties < ActiveRecord::Migration
  def up
    change_table :properties do |t|
      t.references :size, index: true
    end

    Property.all.each do |property|
      property.update(size: Size.where(name: property.dimensions).first)
    end

    change_table :properties do |t|
      t.remove :dimensions
    end
  end

  def down
    change_table :properties do |t|
      t.string :dimensions
    end

    Property.all.each do |property|
      property.update(dimensions: property.size.name)
    end

    change_table :properties do |t|
      t.remove :size
    end
  end
end

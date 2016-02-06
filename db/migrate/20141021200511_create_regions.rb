class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :map
      t.references :continent, index: true

      t.timestamps
    end
  end
end

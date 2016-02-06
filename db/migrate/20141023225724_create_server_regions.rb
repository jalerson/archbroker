class CreateServerRegions < ActiveRecord::Migration
  def change
    create_table :server_regions do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end

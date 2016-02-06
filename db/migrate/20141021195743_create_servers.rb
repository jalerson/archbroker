class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.references :server_region, index: true

      t.timestamps
    end
  end
end

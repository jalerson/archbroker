class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true
      t.references :property, index: true
      t.references :region, index: true
      t.references :server, index: true
      t.string :title
      t.integer :price
      t.string :contact_ingame
      t.boolean :appraisal
      t.boolean :sold
      t.text :obs
      t.text :items
      t.float :x
      t.float :y
      
      t.timestamps
    end
  end
end

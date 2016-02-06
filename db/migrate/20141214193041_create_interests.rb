class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :title
      t.references :server, index: true
      t.string :region_code
      t.integer :min_price
      t.integer :max_price
      t.references :category, index: true
      t.references :type, index: true
      t.references :property, index: true
      t.references :size, index: true
      t.boolean :appraisal
      t.references :user, index: true

      t.timestamps
    end
  end
end

class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :plan_cost
      t.string :dimensions
      t.integer :decor_limit
      t.integer :security_deposit
      t.integer :taxes
      t.references :type, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end

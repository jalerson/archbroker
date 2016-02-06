class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true
      t.references :sale, index: true
      t.boolean :rating
      t.text :reason

      t.timestamps
    end
  end
end

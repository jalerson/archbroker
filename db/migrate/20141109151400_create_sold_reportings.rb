class CreateSoldReportings < ActiveRecord::Migration
  def change
    create_table :sold_reportings do |t|
      t.references :sale, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

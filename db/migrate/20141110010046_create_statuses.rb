class CreateStatuses < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end

    selling = Status.create(name: 'Selling')
    sold = Status.create(name: 'Sold')
    Status.create(name: 'Removed for breaking rules')
    Status.create(name: 'Deleted by the owner')

    add_reference :sales, :status, index: true

    Sale.all.each do |sale|
      if sale.sold
        sale.update(status: sold)
      else
        sale.update(status: selling)
      end
    end

    remove_column :sales, :sold
  end

  def down
    drop_table :statuses

    Status.where(name: 'Selling').first.delete
    Status.where(name: 'Sold').first.delete
    Status.where(name: 'Removed for breaking rules').first.delete
    Status.where(name: 'Deleted by the owner').first.delete

    add_column :sales, :sold, :boolean

    Sale.all.each do |sale|
      if sale.status.id == 1
        sale.update(sold: false)
      else
        sale.update(sold: true)
      end
    end

    remove_reference :sales, :status
  end
end

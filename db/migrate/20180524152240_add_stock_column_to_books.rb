class AddStockColumnToBooks < ActiveRecord::Migration[5.2]
  def up
    add_column :books, :stock, :integer, default: 8
  end

  def down
    remove_column :books, :stock
  end
end

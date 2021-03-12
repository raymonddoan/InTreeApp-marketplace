class ChangeBigIntInStocks < ActiveRecord::Migration[6.0]
  def up
    change_column :stocks, :price, :numeric, precision: 8, scale: 2
  end
  def down
    change_column :stocks, :price, :integer
  end
end

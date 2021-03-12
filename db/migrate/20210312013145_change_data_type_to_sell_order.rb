class ChangeDataTypeToSellOrder < ActiveRecord::Migration[6.0]
  def up
    change_column :sell_orders, :price, :numeric, precision: 8, scale: 2
  end
  def down
    change_column :sell_orders, :price, :bigint
  end
end

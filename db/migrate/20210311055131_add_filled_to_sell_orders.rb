class AddFilledToSellOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :sell_orders, :filled, :boolean, default: false
  end
end

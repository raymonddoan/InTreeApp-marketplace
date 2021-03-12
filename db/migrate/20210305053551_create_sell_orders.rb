class CreateSellOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_orders do |t|
      t.integer :quantity
      t.integer :price
      t.date :expiry_date
      t.references :stock, null: false, foreign_key: true
      t.references :seller
      t.references :buyer

      t.timestamps
    end

    # Add references 
    add_foreign_key :sell_orders, :users, column: :seller_id, primary_key: :id
    add_foreign_key :sell_orders, :users, column: :buyer_id, primary_key: :id, validate: false

  end
end

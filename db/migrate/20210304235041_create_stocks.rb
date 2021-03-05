class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.integer :price
      t.references :sentiment, null: false, foreign_key: true

      t.timestamps
    end
  end
end

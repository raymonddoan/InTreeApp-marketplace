class CreateSentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :sentiments do |t|
      t.boolean :is_bearish
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

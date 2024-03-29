# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_12_015519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t| # Stores the location of the attachments in a hash
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t| # Stores the metadata of the uploaded attachments
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "profiles", force: :cascade do |t| # Generates the profiles the user can customise
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sell_orders", force: :cascade do |t| # Generate the sell orders 
    t.integer "quantity"
    t.decimal "price" # Uses a decimal data type to track both dollars and cents
    t.date "expiry_date" # Date data type for setting the expiry date for the sell order
    t.bigint "stock_id", null: false # no null as each order needs to be associated with a stock

    # Both seller and Buyer have big integer for the user_id
    t.bigint "seller_id" 
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "filled", default: false # default as false as all new sell orders are unfilled

    # Indexes to match keys to the User and Stock
    t.index ["buyer_id"], name: "index_sell_orders_on_buyer_id"
    t.index ["seller_id"], name: "index_sell_orders_on_seller_id"
    t.index ["stock_id"], name: "index_sell_orders_on_stock_id"
  end

  create_table "sentiments", force: :cascade do |t| # Generate the sentiments for the stocks
    t.boolean "is_bearish"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_sentiments_on_stock_id"
    t.index ["user_id"], name: "index_sentiments_on_user_id"
  end

  create_table "stocks", force: :cascade do |t| # Generate the stocks table
    t.string "name"
    t.string "symbol"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t| # Generate the users table from the Devise gem
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id" # Relations between the two active storage tables
  add_foreign_key "profiles", "users" # Relation to Users table
  add_foreign_key "sell_orders", "stocks" # Relation to Stocks table

  # Relations to the Users table
  add_foreign_key "sell_orders", "users", column: "buyer_id"
  add_foreign_key "sell_orders", "users", column: "seller_id"

  # Relations to both Stocks and Users tables
  add_foreign_key "sentiments", "stocks"
  add_foreign_key "sentiments", "users"
end

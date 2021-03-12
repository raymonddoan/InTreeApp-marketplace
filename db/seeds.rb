# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 4 User accounts within seed
if User.count == 0
  User.create!(id: 1, email: "test1@email.com", password: "test1a", password_confirmation: "test1a")
  User.create!(id: 2, email: "test2@email.com", password: "test2b", password_confirmation: "test2b")
  User.create!(id: 3, email: "test3@email.com", password: "test3c", password_confirmation: "test3c")
  User.create!(id: 4, email: "test4@email.com", password: "test4d", password_confirmation: "test4d")
end

if Stock.count == 0
  Stock.create(id: 1, name: "Commonwealth Bank of Australia", symbol: "CBA", price: 87.89)
  Stock.create(id: 2, name: "CSL LTD", symbol: "CSL", price: 250.16)
  Stock.create(id: 3, name: "Afterpay LTD", symbol: "APT", price: 107.19)
  Stock.create(id: 4, name: "Fortescue Group", symbol: "FMG", price: 22.18)
  Stock.create(id: 5, name: "Woolworths LTD", symbol: "WOW", price: 39.22)
end

if SellOrder.count == 0
  SellOrder.create(stock_id: 3, quantity: 3, price: 110.53, seller_id: 1, buyer_id: 2, expiry_date: "2021-04-30")
  SellOrder.create(stock_id: 1, quantity: 5, price: 88.59, seller_id: 3, buyer_id: nil, expiry_date: "2021-04-28")
  SellOrder.create(stock_id: 3, quantity: 7, price: 108.54, seller_id: 4, buyer_id: nil, expiry_date: "2021-04-19")
  SellOrder.create(stock_id: 2, quantity: 10, price: 260.82, seller_id: 1, buyer_id: nil, expiry_date: "2021-04-28")
  SellOrder.create(stock_id: 3, quantity: 19, price: 86.55, seller_id: 1, buyer_id: 3, expiry_date: "2021-04-16")
end


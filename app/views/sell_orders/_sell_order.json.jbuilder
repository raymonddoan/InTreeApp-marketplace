json.extract! sell_order, :id, :quantity, :price, :expiry_date, :stock_id, :seller_id, :buyer_id, :created_at, :updated_at
json.url sell_order_url(sell_order, format: :json)

json.extract! stock, :id, :name, :symbol, :price, :sentiment_id, :created_at, :updated_at
json.url stock_url(stock, format: :json)

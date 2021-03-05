json.extract! sentiment, :id, :is_bearish, :comment, :user_id, :stock_id, :created_at, :updated_at
json.url sentiment_url(sentiment, format: :json)

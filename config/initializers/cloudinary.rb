Cloudinary.config do |config|
  config.folder = "InTree-marketplace"
  config.cloud_name = Rails.application.credentials.dig(:cloudinary, :cloud_name) 
  config.api_key = Rails.application.credentials.dig(:cloudinary, :api_key) 
  config.api_secret = Rails.application.credentials.dig(:cloudinary, :api_secret) 
  config.secure = true
  config.cdn_subdomain = true
end
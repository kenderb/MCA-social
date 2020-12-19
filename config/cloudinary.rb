Cloudinary.config do |config|
  config.cloud_name = 'hdbnc6ura'
  config.api_key = ENV["CL_ID"]
  config.api_secret = ENV["CL_KEY"]
  config.secure = true
  config.cdn_subdomain = true
end
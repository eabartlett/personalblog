Rails.application.config.middleware.use OmniAuth::Builder do
  print ENV["FACEBOOK_SECRET"]
  provider :developer unless Rails.env.production?
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"], :scope => "email,public_profile"
end
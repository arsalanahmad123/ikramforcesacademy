# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'ikramforcesacademy.up.railway.app',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


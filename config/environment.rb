# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.cargster.com",
   :port => 587,
   :domain => "cargster.com",
   :authentication => :login,
   :user_name => "nikola",
   :password => ENV["EMAIL_PASSWORD"]
 }

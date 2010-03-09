# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crm_session',
  :secret      => '34d6c58cbbef737bfd4667553e4ebc94cc0fbdc8fc7e3834755ae7d1416b19aa826e7b6cbc5d2feadd7f573083f9b05761a87b53be703247db67022668d4b738'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_unobtrusive_javascript_presentation_session',
  :secret      => '96db4c4d063155ad2d56a7a027ce58cc237bf44a93417238fa310a24776e367c4a6a3997326528b5ea0da429362ac0433ce8c0a518bf59dd06e4b98de4584d60'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

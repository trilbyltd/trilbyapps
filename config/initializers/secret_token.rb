# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Trilbyapps::Application.config.secret_token = '63adb273f26b8cc328ee792ee35ee6ff03485a3896216a29c0e7e564b283b77b61bf7f6544c7d268c65d51e694070734dd7325b074b3708153f2c8421908fbe5'

begin 
    token_file = Rails.root.to_s + "/local_token"
    to_load = open(token_file).read
    Trilbyapps::Application.configure do
        config.secret_token = to_load
    end

rescue LoadError, Errno::ENOENT => e
    raise "Secret token couldn't be loaded! Error: #{e}"
end
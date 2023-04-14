# Load the environment variables
ENV['ENVIRONMENT'] ||= 'development'

require 'dotenv'
Dotenv.load(
  ".env.#{ENV.fetch('ENVIRONMENT')}.local",
  ".env.#{ENV.fetch('ENVIRONMENT')}", '.env'
)

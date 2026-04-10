ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.

# Load .env before anything else so database.yml ERB can read env vars
require "dotenv"
Dotenv.load(File.expand_path("../.env", __dir__))
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

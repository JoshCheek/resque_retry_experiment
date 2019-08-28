require_relative 'config.rb'
require 'resque-retry/server'

run Resque::Server.new

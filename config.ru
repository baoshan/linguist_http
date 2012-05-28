require 'rack'
require './app'
set :port, 4567
run Sinatra::Application

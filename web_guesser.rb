require 'sinatra'
require 'sinatra/reloader'

get '/' do
 number = rand(100)
 "The SECRET NUMBER is #{number}"
end

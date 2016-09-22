require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
 guess_number = guess.to_i
 if SECRET_NUMBER > guess_number + 5
    message = "Way too low!"
 elsif SECRET_NUMBER < guess_number - 5
    message = "Way too high!"
 elsif SECRET_NUMBER > guess_number
   message = "Too low!"
 elsif SECRET_NUMBER < guess_number
   message = "Too high!"
 else
   message = "You got it right!"
 end
end

get '/' do
 guess = params['guess']
 message = check_guess(guess)
 erb :index, :locals => {:number => SECRET_NUMBER, :message => message }
end

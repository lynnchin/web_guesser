require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
 guess_number = guess.to_i
 if SECRET_NUMBER > guess_number + 5
    message = "Way too low!"
    backgroundColor = 'red'
 elsif SECRET_NUMBER < guess_number - 5
    message = "Way too high!"
    backgroundColor = 'red'
 elsif SECRET_NUMBER > guess_number
   message = "Too low!"
     backgroundColor = '#F27989'
 elsif SECRET_NUMBER < guess_number
   message = "Too high!"
     backgroundColor = '#F27989'
 else
   message = "You got it right!"
     backgroundColor = 'green'
 end
 return message, SECRET_NUMBER, backgroundColor
end

get '/' do
 guess = params['guess']
 message = (check_guess(guess))[0]
 number = check_guess(guess)[1]
 backgroundColor = (check_guess(guess))[2]
 
 erb :index, :locals => {:number => number, :message => message, :backgroundColor => backgroundColor }
end

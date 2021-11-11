require 'sinatra/base'
require 'pg'
require './lib/space'

class MakersBnb < Sinatra::Base


    # ----- Sign Up -----
    get '/' do 
        erb :sign_up
    end
    post '/sign_up' do
      redirect '/sessions/new'
    end
    # ----- Log in -----
    get '/sessions/new' do 
        erb :login
    end
    post '/login' do
       redirect '/spaces'
    end
    # ----- Book a Space -----
    get '/spaces' do
      @space_list = Space.all
      erb :spaces
    end 
    # ----- List Space -----
    get '/spaces/new' do 
        erb :list_space
    end
  
    post '/spaces/new' do
      @new_space = Space.list(name: params[:name],description: params[:description],price: params[:price])
      Available.inser()
      redirect '/spaces'
    end 

    get 'spaces/:id' do

    end 

  run! if app_file == $0

end

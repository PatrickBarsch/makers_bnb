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
      p @space_list
      erb :spaces
    end 
    # ----- List Space -----
    get '/spaces/new' do 
        erb :list_space
    end
  
    post '/spaces/new' do
      Space.list(params[:name], params[:description], params[:price], params[:date_from], params[:date_to])
      redirect '/spaces'
    end 


  run! if app_file == $0

end

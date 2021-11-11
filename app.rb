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
      Space.list(name: params[:name], description: params[:description],price_per_night: params[:price_per_night])
      redirect '/spaces'
    end 

    # get 'spaces/:id' do
    #   @spaces = spaces_list.select do |id|
    #     spaces.id == params[:id]
    #   end.first 
    #   'Correct Page'
    # end 

    get '/spaces/name' do
      'hello'
    end 

  run! if app_file == $0

end

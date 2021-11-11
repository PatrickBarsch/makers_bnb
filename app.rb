require 'sinatra/base'
require 'pg'
require './lib/space'

class MakersBnb < Sinatra::Base

  enable :sessions

    # ----- Sign Up -----
    get '/' do 
      @style = 'display:none'
      erb :sign_up
    end

    post '/sign_up' do
      if params[:passw_new_user_first] == params[:pass_new_user_second]
        redirect '/sessions/new'
      else 
        @style = 'display:block'
        erb :sign_up
      end 
    end

    # ----- Log in -----
    get '/sessions/new' do 
        erb :login
    end
    post '/login' do
      session[:email]= params[:email]
      session[:password] = params[:password]
       redirect '/spaces'
    end
    # ----- Book a Space -----
    get '/spaces' do
      @email = session[:email]
      @password = session[:password]
      @space_list = Space.all
      erb :spaces
    end 
    # ----- List Space -----
    get '/spaces/new' do 
        erb :list_space
    end
  
    post '/spaces/new' do
      p params
      Space.list(name: params[:name], description: params[:description],price_per_night: params[:price_per_night], owner_id: 1)
      redirect '/spaces'
    end 

    get '/spaces/name' do
      'hello'
      redirect '/spaces/:name'
    end 

    get '/spaces/:id' do
      @space_list = Space.all
      @space = @space_list.filter { |space| space.id == params[:id]}
      erb :space_id
    end 

  run! if app_file == $0

end

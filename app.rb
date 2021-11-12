require 'sinatra/base'
require 'pg'
require './lib/availability'
require './lib/space'
require './lib/user'

class MakersBnb < Sinatra::Base

  enable :sessions

  # ----- Sign Up -----
  get '/' do 
    @style = 'display:none'
    erb :sign_up
  end
  
  post '/sign_up' do
    if params[:passw_new_user_first] == params[:pass_new_user_second]
      User.sign_up(email: params[:email_new_user],password: params[:passw_new_user_first])
      @style = 'display:none'
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
    @user_id = User.log_in(email: params[:email], password: params[:password])
    p @user_id
    if @user_id == nil
      @style = 'display:block'
      erb :login
    else
      @style = 'display:none'
     redirect '/spaces'
    end 
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
    new_space = Space.list(name: params[:name], 
      description: params[:description],
      price_per_night: params[:price_per_night], 
      owner_id: 1)
    Availability.list(params[:date_from], params[:date_to], new_space.first['id'])
    redirect '/spaces'
  end 


  get '/spaces/:id' do
    @space_list = Space.all
    @space = @space_list.filter { |space| space.id == params[:id] }
    @space
    
    erb :space_id
  end 
   # ----- Requests -----
  get '/requests/:id' do
    @space_list = Space.all
    @space = @space_list.filter { |space| space.id == params[:id] }
    @space
    erb :requests
  end


  get '/requests' do
    erb :requests
  end 
  run! if app_file == $0

end

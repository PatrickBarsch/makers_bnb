require 'sinatra/base'
require 'pg'
require './lib/availability'
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
    new_space = Space.list(name: params[:name], 
      description: params[:description],
      price_per_night: params[:price_per_night], 
      owner_id: 1)
    Availability.list(params[:date_from], params[:date_to], new_space.first['id'])
    redirect '/spaces'
  end 

  get '/spaces/name' do
    'hello'
    redirect '/spaces/:name'
  end 

  get '/spaces/:id' do
    @space_list = Space.all
    @space = @space_list.filter { |space| space.id == params[:id] }
    # @availability = Availability.when {params[:id]}
    erb :space_id
  end 

  run! if app_file == $0

end

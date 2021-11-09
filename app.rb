require 'sinatra/base'
require 'pg'

class MakersBnb < Sinatra::Base

  get '/spaces' do
    @space_list = Space.all
    erb :spaces
  end 
  
  get '/spaces/new' do 
    erb :list_space
  end

  post '/spaces/new' do
    Space.list(name: params[:title])
    redirect '/spaces'
  end 

  run! if app_file == $0

end

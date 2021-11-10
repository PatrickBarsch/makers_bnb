require 'sinatra/base'
require 'pg'
require './lib/space'

class MakersBnb < Sinatra::Base
  
  get '/spaces' do
    p @space_list = Space.all
    erb :spaces
  end 
  
  get '/spaces/new' do 
    erb :list_space
  end

  post '/spaces/new' do
    Space.list(params[:title], (params[:description]), (params[:price]), (params[:date_from]), (params[:date_to]))
    redirect '/spaces'
  end 

  run! if app_file == $0

end

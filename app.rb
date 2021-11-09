require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/spaces' do
    erb :spaces
  end 
end

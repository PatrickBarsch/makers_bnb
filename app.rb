require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/spaces/new' do 
    erb :list_space
  end

end

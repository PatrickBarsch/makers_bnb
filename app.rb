require 'sinatra/base'
require 'pg'

class MakersBnb < Sinatra::Base

  get '/spaces' do
    connection = PG.connect(dbname: 'makers_bnb_test') 
    @result = connection.exec("SELECT * FROM spaces")
    erb :spaces
  end 

  run! if app_file == $0
end

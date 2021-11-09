require 'sinatra/base'
require 'pg'

class MakersBnb < Sinatra::Base

  get '/spaces' do
    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO spaces (name) VALUES ('Space 1');") 
    @result = connection.exec("SELECT * FROM spaces")
    @display = @result.map { |spaces| spaces['name'] }
    erb :spaces
  end 

  run! if app_file == $0
end

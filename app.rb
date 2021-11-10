require 'sinatra/base'
require 'pg'

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
      connection = PG.connect(dbname: 'makers_bnb_test')
      connection.exec("INSERT INTO spaces (name) VALUES ('Space 1');") 
      @result = connection.exec("SELECT * FROM spaces")
      @display = @result.map { |spaces| spaces['name'] }
      erb :spaces
    end 
    # ----- List Space -----
    get '/spaces/new' do 
        erb :list_space
    end
    post '/list_space' do
      redirect '/spaces'
    end

  run! if app_file == $0

end

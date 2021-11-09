class User 
  def self.sign_up(username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makers_bnb_test") 
    else
      connection = PG.connect(dbname: "makers_bnb")
    end
    connection.exec_params("INSERT INTO users(username) VALUES($1) RETURNING id, username;", [username])
  end
end

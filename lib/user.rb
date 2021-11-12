require_relative './database_connection'

class User 

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.sign_up(email:, password:)
    DatabaseConnection.setup
    sql = "INSERT INTO users(email, password) VALUES($1, $2) RETURNING id, email;"
    added_user = DatabaseConnection.query(sql, [email, password])
    User.new(id: added_user[0]["id"], email: added_user[0]["email"])
  end

  def self.log_in(email:, password:)
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT id FROM users WHERE email ='#{email}' AND password ='#{password}';")
  end 
end

require_relative './database_connection'
require 'bcrypt'

class User 

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.sign_up(email:, password:)
    DatabaseConnection.setup
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO users(email, password) VALUES($1, $2) RETURNING id, email;"
    added_user = DatabaseConnection.query(sql, [email, encrypted_password])
    User.new(id: added_user[0]["id"], email: added_user[0]["email"])
  end

  def self.log_in(email:, password:)
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT id, password FROM users WHERE email ='#{email}';")
    user_found = result.filter { |user| BCrypt::Password.new(user['password']) == password }
    user_id = user_found.first['id'] unless user_found.empty?
  end 
end

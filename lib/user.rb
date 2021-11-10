require 'bcrypt'
require_relative './database_connection'

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

end

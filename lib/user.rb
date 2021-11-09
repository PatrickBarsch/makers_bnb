require 'bcrypt'
require_relative './database_connection.rb'

class User 

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.sign_up(email:, password:)
    connection = DatabaseConnection.setup
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO users(email, password) VALUES($1, $2) RETURNING id, email;"
    added_user = connection.exec_params(sql, [email, encrypted_password])
    added_user = added_user.first
    User.new(id: added_user["id"], email: added_user["email"])
  end

end

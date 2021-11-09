require 'pg'
require_relative './database_connection.rb'

class Space
  def self.list(name)
    connection = DatabaseConnection.setup
    connection.exec_params("INSERT INTO spaces(name) VALUES($1) RETURNING id, name;", [name])
  end
end

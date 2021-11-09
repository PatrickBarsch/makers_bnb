require_relative './database_connection'

class Space
  def self.list(name)
    connection = DatabaseConnection.setup
    connection.query("INSERT INTO spaces(name) VALUES($1) RETURNING id, name;", [name])
  end
end

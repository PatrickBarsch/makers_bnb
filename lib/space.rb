require_relative './database_connection'

class Space
  def self.list(name)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name) VALUES($1) RETURNING id, name;"
    DatabaseConnection.query(sql, [name])
  end
end

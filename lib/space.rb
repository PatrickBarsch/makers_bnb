require_relative './database_connection'

class Space
  def self.list(name, description, price, date_from, date_to)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name, description, price, date_from, date_to)"\
          " VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price, date_from, date_to;"
    DatabaseConnection.query(sql, [name, description, price, date_from, date_to])
  end

  def self.all
     DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map { |space| space['name'] }
  end 

end

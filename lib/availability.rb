require 'database_connection'

class Availability
  def self.list(from, to, space_id)
    DatabaseConnection.setup
    (Date.parse(from)..Date.parse(to)).each do |date|
      sql = "INSERT INTO availabilities(date, space_id) VALUES($1, $2)"
      DatabaseConnection.query(sql, [date, space_id])
    end
  end
end
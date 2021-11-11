require_relative './database_connection'

class Availability
  def self.list(from, to, space_id)
    DatabaseConnection.setup
    (Date.parse(from)..Date.parse(to)).each do |date|
      sql = "INSERT INTO availabilities(date, space_id) VALUES($1, $2)"
      DatabaseConnection.query(sql, [date, space_id])
    end
  end

  def self.when(space_id)
    DatabaseConnection.setup
    sql = "SELECT date FROM availabilities " \
      "WHERE space_id = #{space_id} " \
      "AND user_id_booked IS NULL"
    availabilities = DatabaseConnection.query(sql)
    availabilities.map { |available| available['date'] }
  end
end

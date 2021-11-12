require_relative './database_connection'

class Availability

  attr_reader :id, :date

  def initialize(id:, date:)
    @id = id
    @date = date
  end

  def self.list(from, to, space_id)
    DatabaseConnection.setup
    (Date.parse(from)..Date.parse(to)).each do |date|
      sql = "INSERT INTO availabilities(date, space_id) VALUES($1, $2)"
      DatabaseConnection.query(sql, [date, space_id])
    end
  end

  def self.when(space_id)
    DatabaseConnection.setup
    sql = "SELECT id, date FROM availabilities " \
      "WHERE space_id = #{space_id} " \
      "AND user_id_booked IS NULL"
    availabilities = DatabaseConnection.query(sql)
    availabilities.map { |available| Availability.new(id: available['id'], date: available['date']) }
  end
end

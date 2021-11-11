require_relative './database_connection'

class Space

  attr_reader :name, :description, :price_per_night

  def initialize(name:, description:, price_per_night:)
    @name = name
    @description = description
    @price_per_night = price_per_night.to_i
  end

  def self.list(name:, description:, price_per_night:)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name, description, price_per_night)"\
          " VALUES($1, $2, $3) RETURNING id, name, description, price_per_night;"
    DatabaseConnection.query(sql, [name, description, price_per_night])
  end

  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map { |space| Space.new(name: space['name'], description: space['description'], price_per_night: space['price_per_night']) }
  end 

end

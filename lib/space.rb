require_relative './database_connection'

class Space

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price.to_i
  end

  def self.list(name:, description:, price:)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name, description, price_per_night)"\
          " VALUES($1, $2, $3) RETURNING id, name, description, price_per_night;"
    DatabaseConnection.query(sql, [name, description, price])
  end

  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map { |space| Space.new(name: space['name'], description: space['description'], price: space['price_per_night']) }
  end 

end

require_relative './database_connection'

class Space

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price.to_i
  end

  def self.list(name, description, price, date_from, date_to)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name, description, price, date_from, date_to)"\
          " VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price, date_from, date_to;"
    DatabaseConnection.query(sql, [name, description, price, date_from, date_to])
  end

  def self.all
     DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map { |space| Space.new(name: space['name'], description: space['description'], price: space['price']) }
  end 

end

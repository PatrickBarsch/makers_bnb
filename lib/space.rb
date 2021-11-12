require_relative './database_connection'

class Space

  attr_reader :name, :description, :price_per_night, :id

  def initialize(name:, description:, price_per_night:, id:)
    @name = name
    @description = description
    @price_per_night = price_per_night.to_i
    @id = id 
  end

  def self.list(name:, description:, price_per_night:, owner_id:)
    DatabaseConnection.setup
    sql = "INSERT INTO spaces(name, description, price_per_night, owner_id)"\
          " VALUES($1, $2, $3, $4) RETURNING id, name, description, price_per_night, owner_id;"
    space = DatabaseConnection.query(sql, [name, description, price_per_night, owner_id])
    space = space.first
    Space.new(name: space['name'], 
      description: space['description'], 
      price_per_night: space['price_per_night'], 
      id: space['id']) 
  end

  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space| 
      Space.new(name: space['name'], 
        description: space['description'], 
        price_per_night: space['price_per_night'], 
        id: space['id']) 
    end
  end

  def self.retrieve_by_id(id:)
    DatabaseConnection.setup
    sql = "SELECT * FROM spaces WHERE id = #{id};"
    space_row = DatabaseConnection.query(sql)
    space_row = space_row.first
    Space.new(name: space_row['name'], 
      description: space_row['description'], 
      price_per_night: space_row['price_per_night'], 
      id: space_row['id'])
  end

end

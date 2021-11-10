require 'pg'

class Space
  def self.list(name, description, price, date_from, date_to)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makers_bnb_test") 
    else
      connection = PG.connect(dbname: "makers_bnb")
    end
    
    sql = "INSERT INTO spaces(name, description, price, date_from, date_to)"\
          " VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price, date_from, date_to;"
    connection.exec_params(sql, [name, description, price, date_from, date_to])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makers_bnb_test") 
    else
      connection = PG.connect(dbname: "makers_bnb")
    end

    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| space['name'] }
  end 

end

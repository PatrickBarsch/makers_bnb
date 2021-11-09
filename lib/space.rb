require 'pg'

class Space
  def self.list(name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makers_bnb_test") 
    else
      connection = PG.connect(dbname: "makers_bnb")
    end
    connection.exec_params("INSERT INTO spaces(name) VALUES($1) RETURNING id, name;", [name])
  end
end

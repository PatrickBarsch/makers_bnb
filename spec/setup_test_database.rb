require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE spaces;")
end 

def add_space(name, description, price)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("INSERT INTO spaces (name, description, price)" \
    "VALUES ('#{name}', '#{description}', '#{price}');")
end 

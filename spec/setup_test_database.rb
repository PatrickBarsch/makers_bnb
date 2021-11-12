require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE spaces;")
  connection.exec("TRUNCATE users;")
  connection.exec("TRUNCATE availabilities;")
  connection.exec("TRUNCATE requests;")
end 

def add_space(name, description, price, owner_id = 1)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("INSERT INTO spaces (name, description, price_per_night, owner_id)" \
    "VALUES ('#{name}', '#{description}', '#{price}', '#{owner_id}');")
end 

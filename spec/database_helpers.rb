require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end


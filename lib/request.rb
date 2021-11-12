require 'database_connection'

class Request

  def self.create(availability_id, requestor_id)
    DatabaseConnection.setup
    sql = "INSERT INTO requests(availability_id, requestor_id) " \
      "VALUES('#{availability_id}', '#{requestor_id}') " \
      "RETURNING id, availability_id, requestor_id, denied"
    DatabaseConnection.query(sql)
  end

end

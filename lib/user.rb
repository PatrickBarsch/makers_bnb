class User 

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.sign_up(email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makers_bnb_test") 
    else
      connection = PG.connect(dbname: "makers_bnb")
    end
    sql = "INSERT INTO users(email) VALUES($1) RETURNING id, email;"
    added_user = connection.exec_params(sql, [email])
    added_user = added_user.first
    User.new(id: added_user["id"], email: added_user["email"])
  end

end

require_relative './database_connection'

class Available
    
    def self.insert(date_from:, date_to:, space_id:)
        date_array = self.date_extraction(date_from, date_to)

        DatabaseConnection.setup
        date_array.each do |date|
            sql = "INSERT INTO availabilities(#{date}, space_id, user_id_booked)"\
              " VALUES($1, $2, $3) RETURNING id,;"
            DatabaseConnection.query(sql, [])
        end
        
      end
      def date_extraction(date_from, date_to)
        return
      end
end

INSERT INTO availabilities VALUES (1,'2017-03-14',1,2,'{1,8}')
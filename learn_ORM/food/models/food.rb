require_relative '../config/environment'

class Food
    attr_accessor :id, :name, :type

    def initialize(id: nil, name:, type:)
        @id = id
        @name = name
        @type = type
    end

    def self.create_table
        create_table_sql = <<-SQL
            CREATE TABLE IF NOT EXISTS foods (
                id INTEGER PRIMARY KEY,
                name TEXT,
                type TEXT
            )
        SQL

        $db.execute(create_table_sql)
    end

    def save
        instert_sql = <<-SQL
            INSERT INTO foods (name, type)
            VALUES (?, ?);
        SQL

        $db.execute(instert_sql, @name, @type)
    end

    def self.all
        select_query = <<-SQL
            SELECT * FROM foods;
        SQL

        foods_data = $db.execute(select_query)
        foods_data.map { |food_data| Food.new(id: food_data[0], name: food_data[1], type: food_data[2]) }
    end

    def self.find_by_id(id)
        select_query = <<-SQL
            SELECT * FROM foods WHERE id = ?;
        SQL

        food_data = $db.execute(select_query, id).first
        Food.new(id: food_data[0], name: food_data[1], type: food_data[2])
    end

end

# # create our table
# Food.create_table

# food1 = Food.new(name: "milk", type: "protein")
# food1.save

# foods = Food.all
# foods.each do |food|
#     puts "id: #{food.id} - name: #{food.name} - type #{food.type}"
# end

food = Food.find_by_id(1)
puts food.name 
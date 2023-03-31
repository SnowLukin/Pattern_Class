# frozen_string_literal: true

require 'active_record'

# Configure database connection
database_config = {
	adapter: 'mysql2',
	host: 'localhost',
	username: 'root',
	password: 'password',
	database: 'mysql'
}

# Connect to database
ActiveRecord::Base.establish_connection(database_config)


# Define the schema for "students" table if it doesn't exist yet
unless StudentRecord.table_exists?
	ActiveRecord::Schema.define do
		create_table :students do |t|
			t.string :name
			t.string :middle_name
			t.string :surname
			t.string :git
			t.text :contact_info
		end
	end
end

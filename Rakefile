require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

PG_SPEC = {
  adapter:  'postgresql',
  host:     'localhost',
  database: 'postgres', 
  username: 'ballotbox_admin',
  password: 'slides'
}

APP_DATABASE = 'ballotbox'

desc "create the database"
task "db:create" do 
  ActiveRecord::Base.establish_connection(PG_SPEC)
  ActiveRecord::Base.connection.drop_database(APP_DATABASE) rescue nil
  ActiveRecord::Base.connection.create_database(APP_DATABASE)
end

desc "drop the database"
task "db:drop" do
  ActiveRecord::Base.establish_connection(PG_SPEC)
  ActiveRecord::Base.connection.drop_database(APP_DATABASE) rescue nil
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

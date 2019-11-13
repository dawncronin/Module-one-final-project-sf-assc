require 'bundler'
Bundler.require
require 'dotenv/load'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
Dir[File.join(File.dirname(__FILE__), '../app/models', '*.rb')].each { |f| require f }
# uncomment line 23 and comment out line 22 in order to show all of the
# SQL queries that Active Record handles.
ActiveRecord::Base.logger = nil
# ActiveRecord::Base.logger = Logger.new(STDOUT)
require_all 'app'

$token = File.read("key.txt")

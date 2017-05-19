File.delete 'dbfile' if File.exist? 'dbfile'

require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "dbfile"

ActiveRecord::Base.connection.create_table :ducks do |t|
  t.string :name
end

class Duck < ActiveRecord::Base
  validate do
    errors.add(:base, "Illegal duck name.") unless name[0] == 'D'
  end
end

my_duck = Duck.new
my_duck.name = "Donald"
p my_duck.valid?
my_duck.save!

require_relative '../test/assertions'

assert my_duck.valid?

duck_from_db = Duck.first
p duck_from_db.name

assert_equals "Donald", duck_from_db.name

duck_from_db.delete

File.delete 'dbfile' if File.exist? 'dbfile'
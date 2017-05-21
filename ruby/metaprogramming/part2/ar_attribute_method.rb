require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :databasse => "dbfile"

ActiveRecord::Base.connection.create_table :tasks do |t|
  t.string :description
  t.boolean :completed
end

class Task < ActiveRecord::Base
end

task = Task.new
task.description = 'Clean up garage'
task.completed = true
task.save

p task.description
p task.completed?
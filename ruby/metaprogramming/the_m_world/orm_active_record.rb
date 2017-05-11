require 'active_record'
class Database
  @sql = []

  def self.sql(sql)
    @sql << sql
  end

  def self.read_sql
    @sql
  end
end


class Entity
  attr_reader :table, :ident

  def initialize(table, ident)
    @table = table
    @ident = ident
    Database.sql "INSERT INTO #{@table} (id) VALUES (#{@ident})"
  end

  def set(col, val)
    Database.sql "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{@ident}"
  end

  def get(col)
    Database.sql ("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
  end
end

ActiveRecord::Base.establish_connection(Database)

class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = "Doctor Strangelove"
p movie.title
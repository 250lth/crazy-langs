# orm
# map a table in the db to a class

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


# use Movie to map table -- movies
class Movie < Entity
  def initialize(ident)
    super "movies", ident
  end

  def title
    get "title"
  end

  def title=(value)
    set "title", value
  end

  def director
    get "director"
  end

  def director=(value)
    set "director", value
  end
end


### test
movie = Movie.new(1)
movie.title = "Doctor Strangelove"
movie.director = "Stanley Kubrick"

require_relative '../test/assertions'
expected_sql = ["INSERT INTO movies (id) VALUES (1)",
                "UPDATE movies SET title='Doctor Strangelove' WHERE id=1",
                "UPDATE movies SET director='Stanley Kubrick' WHERE id=1"]
assert_equals expected_sql, Database.read_sql
### inspect method
puts Object.new.inspect

class Person
  def initialize(name)
    @name = name
  end

  def inspect
    @name
  end
end

david = Person.new("David")
puts david
puts david.inspect

### display method
fh = File.open("haha", "w")
"Hello".display(fh)
fh.close
puts(File.read("haha"))
# object can do these things:
# set/reset state of obj
# read state

# instance object:
# use '@' to name a instance val
# instance val can only be seen inside the obj
# instance val can init in one method, and be used in any methods of it

class Person
  def set_name(string)
    puts "Setting person's name..."
    @name = string
  end

  def get_name
    puts "Returning the person's name..."
    @name
  end
end

joe = Person.new
joe.set_name("Joe")
puts joe.get_name

## Use state to init object
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def venue
    @venue
  end

  def date
    @date
  end
end

th = Ticket.new("Town Hall", "11/12/13")
cc = Ticket.new("Convention Center", "12/13/14")
puts "We've created two tickets."
puts "The 1st is for a #{th.venue} event on #{th.date}"
puts "The 2nd is for an event on #{cc.date} at #{cc.venue}"


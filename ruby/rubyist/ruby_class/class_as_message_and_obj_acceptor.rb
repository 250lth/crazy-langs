## Create class object
class Ticket
  attr_reader :venue, :date
  attr_accessor :price

  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

my_class = Class.new
instance_of_my_class = Class.new

# use Class.new to def method
c = Class.new do
  def say_hello
    puts "Hello"
  end
end

c.new.say_hello

## How class object call methods
# call a singleton method of a class

## Singleton method
def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

th = Ticket.new("Town Hall", "11/12/13")
cc = Ticket.new("Convension", "12/13/14")
fg = Ticket.new("Fairgrounds", "13/14/15")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th, cc, fg)
puts "The highest-priced ticket is the one for #{highest.venue}."

### Class method

## Time and reason of writing a class method
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def Temperature.f2f(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

puts Temperature.c2f(100)

## Class method and instance method
puts "Testing the response of a ticket instance..."
# wrong = fg.most_expensive => fg does not have that method, but Ticket has
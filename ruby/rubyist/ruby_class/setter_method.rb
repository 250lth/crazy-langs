## '=' in method naming
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def set_price(amount)
    @price = amount
  end

  def price
    @price
  end
end

ticket = Ticket.new("Town Hall", "11/12/13")
ticket.set_price(63.00)
puts "The ticket costs $#{"%.2f" % ticket.price}"
ticket.set_price(72.50)
puts "Whoops -- it just went up. It now costs $#{"%.2f" % ticket.price}"

## Grammar sugar of naming value
class Ticket
  def price=(amount)
    @price = amount
  end
end
ticket.price = 63.00
puts "Using grammar sugar: ticket's price now is $#{ticket.price}!"

## Fully use setter method
# check first
class Ticket
  def price=(amount)
    if (amount * 100).to_i == amount * 100
      @price = amount
    else
      puts "The price seems to be malformed"
    end
  end

  def price
    @price
  end
end

ticket.price = 1.2312

# normalize
class TravelAgentSession
  def year=(y)
    @year = y.to_i
    if @year < 100
      @year = @year + 2000
    end
  end
end

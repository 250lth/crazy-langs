# def class and method
class Ticket
  def event
    "Can't really be specified yet..."
  end
end

ticket = Ticket.new
puts ticket.event

## Instance method
def ticket.price
  "Tell me the price!"
end
puts ticket.price

## Override method
class C
  def m
    puts "First Def of m"
  end

  def m
    puts "Second Def of m"
  end
end
C.new.m

## Redefine class
class C
  # class code
end

class C
  def x
    "ahhaha"
  end
end

class C
  def y
    "hehehe"
  end
end

puts Time.new.strftime("%m-%d-%y")

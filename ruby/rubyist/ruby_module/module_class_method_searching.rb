## method searching
module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
end

class D < C
end

obj = D.new
obj.report

## Define multi times of the same-name method
module InterestBearing
  def calculate_interest
    puts "Placeholder! We are in module Interesting!"
  end
end

class BankAccount
  include InterestBearing

  def cauculate_interest
    puts "Placeholder! We are in class BankAccount."
    puts "And we are overriding the calculate_interest method..."
    puts "which was defined in the Interesting module."
  end
end

account = BankAccount.new
account.cauculate_interest

# include 2 modules
module N
  def report
    puts "'report' method in module N"
  end
end

class C
  include M
  include N
end

c = C.new
c.report

# same module multi times
class C
  include M
  include N
  include M
end
c = C.new
c.report  # Still in module N, because M is already in the searching path

## the principle of prepend
# if prepend one module, first search method in the prepended module, then class
module MeFirst
  def report
    puts "Hello from module!"
  end
end

class Person
  prepend MeFirst

  def report
    puts "Hello from class!"
  end
end

p = Person.new
p.report

## Use super to search up the path
class D
  include M

  def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super' call."
  end
end

d = D.new
d.report

# use super to package a method in subclass
class Bicycle
  attr_reader :gears, :wheels, :seats

  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
end

class Tradem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end
end
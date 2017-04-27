### Create
module MyFirstModule
  def say_hello
    puts "Hello"
  end
end

class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.say_hello

## use module to implement stack
module Stacklike
  def stack
    @stack ||= []   # first time called, if not set, stack will be []
  end

  def add_to_stack(obj)
    stack.push(obj)
  end

  def take_from_stack
    stack.pop
  end
end

## Mixin the module into class
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack("item 1")
s.add_to_stack("item 2")
s.add_to_stack("item 3")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack
puts "Removed this object"
puts taken
puts "Now on stack:"
puts s.stack

## Further using of module
class Suitcase
end

class CargoHold
  include Stacklike

  def load_and_report(obj)
    print "Loading object: "
    puts obj.object_id
    add_to_stack(obj)
  end

  def unload
    take_from_stack
  end
end

ch = CargoHold.new
sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print "The fist suitcase off the plane is... "
puts first_unloaded.object_id


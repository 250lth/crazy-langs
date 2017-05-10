### find: the first matching
p [1,2,3,4,5,7,10].find { |n| n > 5 }

p failure = lambda { 11 }
p over_ten = [1,2,3,4,5,6].find(failure) { |n| n > 10 }

### find_all
a = [1,2,3,4,5,6,7,8,9,10]
p a.find_all { |item| item > 5 }
p a.select { |item| item > 100 }


### grep
colors = %w{ red orange yellow green blue indigo violet }
p colors
p colors.grep(/o/)
p colors.grep(/o/) { |color| color.capitalize }

### group_by, partition
p colors.group_by { |color| color.size }

class Person
  attr_accessor :age
  def initialize(options)
    self.age = options[:age]
  end
  def teenager?
    (13..19) === age
  end
end

people = 10.step(25, 3).map { |i| Person.new(:age => i) }
p people
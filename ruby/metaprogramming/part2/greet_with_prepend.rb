class MyClass
  def greet
    "hello"
  end
end

p MyClass.new.greet

module EnthusiasticGreetings
  def greet
    "Hey, #{super}!!"
  end
end

class MyClass
  prepend EnthusiasticGreetings
end

p MyClass.ancestors[0..2]
p MyClass.new.greet


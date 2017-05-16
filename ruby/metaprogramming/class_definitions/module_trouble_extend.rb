module MyModule
  def my_method
    'hello'
  end
end

obj = Object.new
obj.extend MyModule
p obj.my_method

class MyClass
  extend MyModule
end

p MyClass.my_method
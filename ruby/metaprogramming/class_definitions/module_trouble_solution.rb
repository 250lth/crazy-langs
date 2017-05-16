module MyModule
  def my_method
    'hello'
  end
end

class MyClass
  class << self
    include MyModule
  end
end

p MyClass.my_method
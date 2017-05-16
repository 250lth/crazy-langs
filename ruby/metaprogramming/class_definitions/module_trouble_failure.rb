module MyModule
  def self.my_method
    'hello'
  end
end

class MyClass
  include MyModule
end

#MyClass.MyModule
#=> NoMethodError
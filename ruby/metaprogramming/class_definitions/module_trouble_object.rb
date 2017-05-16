module MyModule
  def my_method
    'hello'
  end
end

obj = Object.new

class << obj
  include MyModule
end

p obj.my_method
p obj.singleton_methods
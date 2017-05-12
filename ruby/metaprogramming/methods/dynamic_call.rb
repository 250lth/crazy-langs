class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
p obj.my_method(3)
p obj.send(:my_method, 3) # dynamic dispatching
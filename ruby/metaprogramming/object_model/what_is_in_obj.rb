class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
p obj.class

# instance var
p obj.my_method
p obj.instance_variables

# method
p obj.methods.grep(/my/)

# instance method
p String.instance_methods == "abc".methods
p String.methods == "abc".methods
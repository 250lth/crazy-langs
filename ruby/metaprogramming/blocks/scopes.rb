v1 = 1

class MyClass
  v2 = 2
  local_variables

  def my_method
    v3 = 3
    local_variables
  end

  local_variables
end

obj = MyClass.new
p obj.my_method
p obj.my_method
p local_variables
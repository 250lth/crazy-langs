## use Kernel#binding to get the scope
class MyClass
  def my_method
    @x = 1
    binding
  end
end

b = MyClass.new.my_method

p eval "@x", b


### TOPLEVEL_BINDING
class AnotherClass
  def my_method
    eval "self", TOPLEVEL_BINDING
  end
end

p AnotherClass.new.my_method

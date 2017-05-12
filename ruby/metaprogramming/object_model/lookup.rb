class MyClass
  def my_method
    'mymethod()'
  end
end

class MySubclass < MyClass
end

obj = MySubclass.new
p obj.my_method()
class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
p obj.my_method(2)

require_relative '../test/assertions'
assert_equals 6, obj.my_method(2)
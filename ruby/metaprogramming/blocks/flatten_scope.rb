my_var = "Success"

=begin
class MyClass
  def my_method

  end
end
=end

MyClass = Class.new do
  puts "#{my_var} in the class definition!"

  define_method :my_method do
    "#{my_var} in the method!"
  end
end

p MyClass.new.my_method
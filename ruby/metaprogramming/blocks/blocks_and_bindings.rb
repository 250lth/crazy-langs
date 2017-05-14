def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"
p my_method { |y| "#{x}, #{y} world" }
def my_method(greeting)
  "#{greeting}, #{yield}"
end

my_proc = proc { "Bill" }
p my_method("Hello", &my_proc)
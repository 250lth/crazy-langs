def math(a, b)
  yield(a, b)
end

def do_math(a, b, &operation)
  math(a, b, &operation)
end

p do_math(2, 3) { |x, y| x * y }

def my_method(&the_proc)
  the_proc
end

p = my_method { |name| "Hello, #{name}!" }
p p.class
p p.call("Bill")
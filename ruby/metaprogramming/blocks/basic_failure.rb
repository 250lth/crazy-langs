def a_method(a, b)
  a + yield(a, b)
end

p a_method(1, 2) { |x, y| (x + y) * 3 }

def another_method
  return yield if block_given?
  'no block'
end

p another_method
p another_method { "here is a block!" }
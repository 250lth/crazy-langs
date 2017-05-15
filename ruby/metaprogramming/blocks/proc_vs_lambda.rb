### difference of 'return'
def double(callable_object)
  callable_object.call * 2
end

l = lambda { return 10 }
p double(l)

def another_double
  p = Proc.new { return 10 }
  result = p.call
  return result * 2
end

p another_double

### difference of checking args
p = Proc.new { |a,b| [a,b] }
p p.arity

p = Proc.new { |a,b| [a,b] }
p p.call(1,2,3)
p p.call(1)
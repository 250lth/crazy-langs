module M1
  def my_method
    'M1#my_method()'
  end
end

class C
  include M1
end

class D < C
end

p D.ancestors

### after ruby 2
## prepend
class C2
  prepend M1
end

class D2 < C2
end

p D2.ancestors
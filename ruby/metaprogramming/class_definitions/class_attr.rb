class MyClass
  attr_accessor :a
end

obj = MyClass.new
obj.a = 2
p obj.a

=begin
class Class
  attr_accessor :b
end

MyClass.b = 42
p MyClass.b
=end

class MyClass
  class << self
    attr_accessor :c
  end
end

MyClass.c = 'It works!'
p MyClass.c

def MyClass.c=(value)
  @c = value
end

def MyClass.c
  @c
end

p MyClass.c=("haha")
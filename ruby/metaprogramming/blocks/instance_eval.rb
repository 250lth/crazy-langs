class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  p self
  p @v
end

v = 2
p obj.instance_eval { @v = v }
p obj.instance_eval { @v }
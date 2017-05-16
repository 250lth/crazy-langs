# 1
def MyClass.a_class_method
end

# 2
class MyClass
  def self.another_class_method
  end
end

# 3
class MyClass
  class << self
    def yet_another_class_method
    end
  end
end
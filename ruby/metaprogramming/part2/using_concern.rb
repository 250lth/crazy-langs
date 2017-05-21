require 'active_support'

module MyConcern
  extend ActiveSupport::Concern

  def an_instance_method
    "an instance method"
  end

  module ClassMethods
    def a_class_method
      "a class method"
    end
  end
end

class MyClass
  include MyConcern
end

p MyClass.new.an_instance_method
p MyClass.a_class_method
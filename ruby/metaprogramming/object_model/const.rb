module MyModule
  MyConstant = 'Outer constant'

  class MyClass
    MyConstant = 'Inner constant'
  end
end


module M
  class C
    X = 'a constant'
  end
  p C::X
end
p M::C::X


Y = 'a root-level constant'

module M
  Y = 'a constant in M'
  p Y
  p ::Y
end


## Module has a instance method and a class method with the same name: constants
p M.constants
p Module.constants.include? :Object
p Module.constants.include? :Module

## use Module.nesting to know the current dir
module M
  class C
    module M2
      p Module.nesting
    end
  end
end
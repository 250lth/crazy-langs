p names = %w{David Yukihiro Chad Amy}
p names.map {|name| name.upcase}

## return of map
array = [1,2,3,4,5]
result = array.map { |n| puts n * 100 }
p result

### map!
p names.map!(&:upcase)

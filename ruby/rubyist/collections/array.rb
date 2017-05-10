### create

# Array.new
p Array.new(3, "abc")
n = 0
p Array.new(3) { n += 1; n * 10 }

# []
p [1,2,3][1]

# Array method
string = "A string"
p string.respond_to?(:to_ary)
p string.respond_to?(:to_a)
p Array(string)
def string.to_a
  split(//)
end
p Array(string)

# %w %W
p %w{ David A. Black }
p %w{ David\ A.\ Black is a Rubist. }
p %W{ David is #{2014-1959} years old. }

# %i %I
p %i{ a b c }
d = "David"
p %I{ "#{d}"}


### Insert, get, remove

# set and get multiple
a = ["red", "orange", "yellow", "purple", "gray", "indigo", "violet"]
p a[3,2]
a[3,2] = "green", "blue"
p a

# operate both ends
p a.unshift(0)
p a.push(5)
p a << 5
p a.push(6, 7, 8)
p a.pop
p a.shift
p a.pop(2)
p a.shift(2)

### concat
p [1,2,3].concat([4,5,6])
a = [1,2,3]
b = a + [4,5,6]
p a
p a.replace([4,5,6])

### convert
p array = [1,2,[3,4,[5],[6,[7,8]]]]
p array.flatten
p array.flatten(1)
p array.flatten(2)
p array.reverse
p [1,2,3,1,3,4].uniq
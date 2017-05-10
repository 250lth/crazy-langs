### create
p r = Range.new(1, 100)
p r = 1..100
p r = 1...100

### include
p r = 1..10
p r.begin
p r.end

p r.exclude_end?

p r = "a".."z"
p r.cover?("a")
p r.cover?("abc")
p r.cover?([])

p r.include?("a")
p r.include?"abc"
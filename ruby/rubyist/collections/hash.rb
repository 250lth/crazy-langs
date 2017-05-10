### create

# {}

# Hash.new

# Hash.[]

# Hash method

### insert, get, remove

# add
state_hash = {}
p state_hash["New York"] = "NY"
p state_hash.store("Beijing", "BJ")
h = Hash.new
h["a"] = 1
h["a"] = 2
p h["a"]

# get : []
# fetch

# default
p h = Hash.new(0)
p h["no such key"]
p h = Hash.new { |hash, key| hash[key] = 0 }
p h["new key"]
p h

### concat
p h1 = {"Smith" => "John", "Jones" => "Jane"}
p h2 = {"Smith" => "Jim"}
p h1.update(h2)
p h1 = {"Smith" => "John", "Jones" => "Jane"}
p h3 = h1.merge(h2)

### convert
h = Hash[1,2,3,4,5,6]
p h
p h.select { |k, v| k > 1 }
p h.reject {|k, v| k > 1}

p h.invert

### hash in method


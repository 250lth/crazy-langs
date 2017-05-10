array = ["ruby", "diamond", "emerald"]
hash = { 0 => "ruby", 1 => "diamond", 2 => "emerald" }
p array
p hash

hash.each.each_with_index { |(key, value), i|
  puts "Pair #{i} is: #{key}/#{value}"
}
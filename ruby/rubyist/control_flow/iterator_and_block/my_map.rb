class Array
  def my_map
    c = 0
    acc = []
    until c == size
      acc << yield(self[c])
      c += 1
    end
  end
end

names = ["David", "Alan", "Black"]
names.my_map { |name| puts name.upcase }

## Another to implement map
class Array
  def my_map
    acc = []
    each { |e| acc << yield(e) }
  end
end

names.my_map { |name| puts name.upcase }
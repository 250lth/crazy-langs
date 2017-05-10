### first
p [1,2,3,4].first
p (1..10).first
{ 1 => 2, "one" => "two" }.first
hash = { 3 => "three", 1 => "one", 2 => "two"}
p hash.first
hash[3] = "trois"
p hash.first

class Die
  include Enumerable

  def each
    loop do
      yield rand(6) + 1
    end
  end
end

puts "Welcome to 'You win if you roll 6!'"
d = Die.new
d.each do |roll|
  puts "You rolled a  #{roll}."
  if roll == 6
    puts "You win!"
    break
  end
end

### take and drop

### min and max
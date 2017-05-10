### reverse_each
[1,2,3].reverse_each { |e| puts e * 10 }

### each_with_index
names = ["Beijing", "Shanghai", "Harbin", "Zhuhai"]
names.each_with_index do |pres, i|
  puts "#{i + 1}. #{pres}"
end

%w{a b c}.each_index { |i| puts i }

### each_slice each_cons
array = [1,2,3,4,5,6,7]
array.each_slice(3) { |slice| p slice }
array.each_cons(3) { |cons| p cons }

### cycle
class Playground
  SUITS = %w{ clubs diamonds hearts spades }
  RANKS = %w{2 3 4 5 6 7 8 9 10 J Q K A}
  class Deck
    attr_reader :cards
    def initialize(n = 1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

deck = Playground::Deck.new(2)
p deck

### inject
p [1,2,3,4].inject(0) {|acc, n| acc + n}

[1,2,3,4].inject do |acc, n|
  puts "Adding #{acc} and #{n}... #{acc + n}"
  acc + n
  end
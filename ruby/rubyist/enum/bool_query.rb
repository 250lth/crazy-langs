states = ["Beijing", "Shanghai", "Harbin", "Guangzhou", "Hong Kong", "Zhuhai"]

p states.all? { |state| state =~ / / }
p states.any? { |state| state =~ / / }
p states.one? { |state| state =~ /Ha/ }
p states.none? { |state| state =~ /Fu/ }

p states.include?("Beijing")
p states.all? { |state, abbr| state =~ / / }


r = Range.new(1,10)
p r.one? { |n| n == 5 }
p r.none? { |n| n % 2 == 0 }

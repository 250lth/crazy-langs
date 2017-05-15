def event(description)
  puts "ALERT: #{description}" if yield
end

load 'events.rb'
def setup(&block)
  @setup << block
end

def event(description, &block)
  @events << {:description => description, :condition => block}
end

@setup = []
@events = []

load 'events.rb'

@events.each do |event|
  @setup.each do |setup|
    setup.call
  end
  puts "ALERT: #{event[:description]}" if event[:condition].call
end
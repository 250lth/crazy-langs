setup do
  puts "Setting up sky"
  @sky_height = 100
end

setup do
  puts "Setting up moutains"
  @moutains_height = 200
end

event "the sky is falling" do
  @sky_height < 300
end

event "it's getting closer" do
  @sky_height < @moutains_height
end

event "whoops... too late" do
  @sky_height < 0
end
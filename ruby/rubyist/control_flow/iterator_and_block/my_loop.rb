def my_loop
  while true
    yield
  end
end

my_loop { puts "My-looping forever!" }
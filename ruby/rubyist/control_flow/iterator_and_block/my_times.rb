class Integer
  def my_times
    c = 0
    until c == self
      yield(c)
      c += 1
    end
    self
  end
end

5.my_times { |i| puts "I'm on iteration #{i}" }
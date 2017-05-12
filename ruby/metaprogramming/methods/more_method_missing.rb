class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method} (#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  # a block
end
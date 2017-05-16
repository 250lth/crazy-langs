class String
  alias_method :read_length, :length

  def length
    read_length > 5 ? 'long' : 'short'
  end
end

p "War and Peace".length
p "War and Peace".read_length

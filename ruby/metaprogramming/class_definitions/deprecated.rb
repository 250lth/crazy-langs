class Book
  def title
  end

  def subtitle
  end

  def lend_to(user)
    puts "Lending to #{user}"
  end

  def self.deprecated(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end

  deprecated :GetTitle, :title
  deprecated :LEND_TO_USER, :lend_to
  deprecated :title2, :subtitle
end

b = Book.new
b.LEND_TO_USER("Bill")
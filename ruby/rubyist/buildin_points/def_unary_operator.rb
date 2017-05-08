### Define +@/-@ to implement +/-object

class Banner
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end

  def +@
    @text.upcase
  end

  def -@
    @text.downcase
  end
end

banner = Banner.new("Eat at David's!")
puts banner
puts +banner
puts -banner
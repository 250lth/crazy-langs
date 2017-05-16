s1, s2 = "abc", "def"

s1.instance_eval do
  def swoosh!
    reverse
  end
end

p s1.swoosh!
p s2.respond_to?(:swoosh!)
begin
class Lawyer; end

nick = Lawyer.new
nick.talk_simple
rescue Exception => e
  # NonMethod Error
end

begin
  nick.send :method_missing, :method
rescue Exception => e
  #NoMethodError:
end
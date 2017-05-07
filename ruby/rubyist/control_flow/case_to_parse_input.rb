print "Exit the program? (yes or no):"
answer = gets.chomp

case answer
  when "yes"
    puts "Goodbye"
    exit
  when "no"
    puts "Ok, we'll continue"
  else
    puts "That's an unknown answer -- assuming you meant 'no'"
end
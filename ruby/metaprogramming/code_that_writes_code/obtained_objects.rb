userinput = "User input: #{gets()}"
puts userinput.tainted?

$SAFE = 1
userinput = "User input: #{gets()}"
eval userinput
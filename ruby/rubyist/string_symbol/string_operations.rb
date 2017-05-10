## substring
string = "Ruby is a cool language."
p string[5]
p string[-12]
p string[5, 10]
p string[7..14]
p string[-12..-3]
p string["cool lang"]
p string["crazy cool lang"]
p string[/c[ol ]+/]
p string.slice!("cool ")
p string
string = "Ruby is a cool language."
p string["cool"] = "great"
p string
p string[-1] = "!"
p string
p string[-9..-1] = "thing to learn!"
p string

## Concat strings
p "a" + "b"
str = "hi "
p str + "there"
p str
p str << "there."
p str

## insert
str = "Hi "
p "#{str} there."
p "MY name is #{
  class Person
    attr_accessor :name
  end
  d = Person.new
  d.name = "David"
  d.name
}."

## to_s
class Person
  attr_accessor :name
  def to_s
    name
  end
end
p david = Person.new
p david.name = "David"
p "Hello, #{david}!"

## check strings
# bool
p string.include?("Ruby")
p string.include?("English")
p string.start_with?("Ruby")
p string.end_with?("!!!")
p string.empty?
p "".empty?
# content
p string.size
p string.count("a")
p string.count("g-m")
p string.count("A-Z")
p string.count("aey. ")
p string.count("aey. ")
p string.count("aey. ", "^l")
# ord
p "abc".ord
p 97.chr

## compare & sort
p "a" <=> "b"
p "b" <=> "a"

## string convert
p string = "David A. Black"
p string.upcase
p string.downcase
p string.capitalize

## convert format
p string.rjust(25)
p string.ljust(25)
p string.rjust(25, '.')
p "The middle".center(20, "*")
string = "  David A. Black"
p string.strip
p string.rstrip

## content convert
p "David A. Black".chomp
p "David A. Black\n".chomp
p "David A. Black".chomp('ck')

## convert type
p "100".to_i(17)
p "100".oct


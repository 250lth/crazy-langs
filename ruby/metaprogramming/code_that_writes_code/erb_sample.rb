require 'erb'

erb = ERB.new(File.read('template.rhtml'))
erb.run
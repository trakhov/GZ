# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	Array.new(9) { rand(10..30) }
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__

# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		p: 5 * rand(14..30),
		c: 5 * rand(4..10)
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__

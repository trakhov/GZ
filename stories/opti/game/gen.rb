# -*- coding: utf-8 -*-
## матричные игры ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

# write 50, __FILE__

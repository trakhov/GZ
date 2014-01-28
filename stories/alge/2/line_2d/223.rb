# -*- coding: utf-8 -*-
### прямые на плоскости ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		proc: '\%',
		
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
# -*- coding: utf-8 -*-

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	
	{
		proc: '%',
		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
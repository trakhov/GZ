# -*- coding: utf-8 -*-

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		# name: value,		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
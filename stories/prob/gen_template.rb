# -*- coding: utf-8 -*-

[
	'../helpers',
	# './stat_helpers',
	# './prob_helpers',
].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	
	{
		name: value,
		
	}
end

# options.each { |o| puts "#{o[0]}: #{o[1]}\n" }

# write 100
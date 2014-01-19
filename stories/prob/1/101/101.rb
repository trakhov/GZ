# -*- coding: utf-8 -*-

[
	'helpers',
	# 'prob/stat_helpers',
	# 'prob/prob_helpers',
	# 'prob/distributions'
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	
	{
		# name: value,
		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100
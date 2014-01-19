# -*- coding: utf-8 -*-
# нормальный закон распределения

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	
	{
		proc: '\%',		
	}
end

write 100
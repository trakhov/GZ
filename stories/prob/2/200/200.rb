# -*- coding: utf-8 -*-

[
	'helpers',
	# 'prob/stat_helpers',
	'prob/prob_helpers',
	# 'prob/distributions'
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	n = rand(4..5)
	vals = drv_vals n
	probs = drv_probs n
	
	{
		drv: table(vals, probs),
		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100
# -*- coding: utf-8 -*-

[
	'../helpers',
	'./stat_helpers',
	# './prob_helpers',
].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]


def options	
	n = rand(4..6)
	{
		freq: table(stat_vals(n), stat_probs(n, rel=false)),
		relfreq: table(stat_vals(n), stat_probs(n)),
		n: rand(1..6) * 20		
	}
end

# puts options

write 100
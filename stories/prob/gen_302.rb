# -*- coding: utf-8 -*-

[
	'../helpers',
	'./stat_helpers',
	# './prob_helpers',
].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	n = rand(4..6)
	vals = stat_vals n
	probs = stat_probs n, rel=false
	n_big = probs.reduce :+
	
	{
		n_big: n_big,
		n_sml: n,
		freq: (table vals, probs),
		row: len_vals(n).join(', '),
	}
end

# options.each { |o| puts "#{o[0]}:\t#{o[1]}\n" }

write 100
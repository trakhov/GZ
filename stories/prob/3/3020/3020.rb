# -*- coding: utf-8 -*-
# распределение выборки, характеристики

[
	'helpers',
	# 'prob/prob_helpers',
	'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options	
	n = rand(4..6)
	{
		freq: table(stat_vals(n), stat_probs(n, rel=false)),
		relfreq: table(stat_vals(n), stat_probs(n)),
		n: rand(1..6) * 20		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100
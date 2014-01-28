# -*- coding: utf-8 -*-
# оценки генеральных средней и дисперсии

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

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

write 50, __FILE__
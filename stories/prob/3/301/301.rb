# -*- coding: utf-8 -*-
# распределение выборки: полигон, функция распределения

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }


def options	
	n = rand(4..6)
	{
		freq: table(stat_vals(n), stat_probs(n, rel=false)),
		relfreq: table(stat_vals(n), stat_probs(n)),
		n: rand(1..6) * 20		
	}
end

# puts options

write 60, __FILE__
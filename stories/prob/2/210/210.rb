# -*- coding: utf-8 -*-
# геометрическая св

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	n = (4..10).map { |e| e }.shuffle!.pop
	p = (1..9).map { |e| e/10.0 }.shuffle!.pop
	
	{
		p_bern: prob.values.shuffle!.pop,
		# n_bern: n,
		# np_bern: "#{(n*p).round(2).to_s.sub('.0','').sub('.', '{,}')}",
		# npq_bern: "$#{(n*p*(1-p)).round(3).to_s.sub('.0','').sub('.', '{,}')}$"
	}
end

write 60, __FILE__
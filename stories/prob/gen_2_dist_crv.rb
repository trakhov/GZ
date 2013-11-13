# -*- coding: utf-8 -*-

require_relative '../helpers'

def dist_fun_crv
	m = rand(1..3)
	a = rand(0..4-m)
	b = a + rand(2..3)
	k = b**m - a**m

	p1 = rand(a-1..a+2)
	p2 = p1	
	while p2 == p1
	 p2 = rand(p1..p1+3)
	end

	func = 'F(x) = \begin{cases}0, & x < %{a}¸\\\\ %{fr1}%{fr2}, & %{a} \leqslant x \leqslant %{b}, \\\ 1, & x > %{b} \end{cases}' % {
		a: a, b: b,
		fr1: m > 1 ? "x^#{m}/#{k}" : "x/#{k}",
		fr2: a == 0 ? '' : "-#{frac a**m, k}",
		# fr1: m > 1 ? "\\frac{x^{#{m}}}{#{k}}" : "\\frac{x}{#{k}}",
		# fr2: a == 0 ? '' : "-\\frac{#{a**m}}{#{k}}"
	}
	{func: func, p1: p1, p2: p2}
end

# puts dist_fun_crv

def generate 
	tmpl = open_tmpl './tmpl_2_dist_crv'
	options = dist_fun_crv

	tmpl % {
		func: options[:func],
		p1: options[:p1],
		p2: options[:p2]
	}
end

write 100, '2_dist_crv.txt'
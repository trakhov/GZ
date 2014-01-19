# -*- coding: utf-8 -*-
# НСВ: мода, медиана, матож

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]


def options
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


	aa = rand(2..3)
	k = [frac(3, aa**3), (-1) * frac(3, 2 * aa**3)].shuffle!.pop

	p3, p4 = [(-1) * aa / 2, aa / 2].sort!
	
	dens = [
		"#{tex_frac k}(x-#{aa})^2, & x \\in (0; #{aa}), \\\\ 0, & x \\not\\in (0; #{aa}).",
		"#{tex_frac k}(x+#{aa})^2, & x \\in (-#{aa}; 0), \\\\ 0, & x \\not\\in (-#{aa}; 0)."
	].shuffle!.pop

	{
		func: func, 
		p1: p1, 
		p2: p2,
		p3: p3, 
		p4: p4,
		dens: dens
	}
end


write 100
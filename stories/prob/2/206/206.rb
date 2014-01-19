# -*- coding: utf-8 -*-
# НСВ, ДСВ: начальные и центральные моменты

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	a = rand(0..4)
	b = a + rand(1..4)
	k = frac(2, b**2 - a**2)
	
	{
		a: a,
		b: b,
		func: "\\frac{#{k.numerator}}{#{k.denominator}}x",
		values: drv_vals(3).join(' & '),
		probs: drv_probs(3).map { |p| "0{,}#{p}" }.join(' & ')
	}
end


write 100
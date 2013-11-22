# -*- coding: utf-8 -*-

require_relative '../helpers'

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

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[6]'
	tmpl % options
end

# puts generate
write 100, '2[6].txt'
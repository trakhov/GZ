# -*- coding: utf-8 -*-
# нормальный закон распределения: вероятность, квантили, проц. т.

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	mult = [1, 10].shuffle!.pop
	a = rand(15) * mult * sign
	sigma = rand(2..5) * mult
	p1 = a - (sigma + rand(mult..sigma))
	p2 = a + (sigma + rand(mult..sigma))

	delta = 'x ' + 
	if a > 0 
		"+ #{a}" 
	elsif a < 0 
		"- #{-a}" 
	else 
		'' 
	end

	quantile = rand(1..9)
	point = rand(1..9) * 10

	{
		delta: delta, 
		sigma: sigma, 
		p1: p1, 
		p2: p2, 
		quantile: quantile, 
		point:point, 
		proc_sym: '\%'}
end

write_rb 50, __FILE__
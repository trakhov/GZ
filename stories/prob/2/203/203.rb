# -*- coding: utf-8 -*-
# нормальный закон распределения: вероятность, квантили, проц. т.

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	mult = [1, 10].shuffle!.pop
	a = rand(15) * mult * sign
	sigma = rand(2..5) * mult
	p1 = a - (sigma + rand(mult..sigma))
	p2 = a + (sigma + rand(mult..sigma))

	delta = if a > 0
		"x + #{a}"
	elsif a < 0
		"x - #{-a}"
	elsif a == 0
		"x"
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

write 100
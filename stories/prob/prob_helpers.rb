# -*- coding: utf-8 -*-

include Math

def drv_probs(n)	
	a = []
	sum = 0
	i = 0
	while i < n-1 do
		max = 11 - sum - n + i
			a.push rand(1..max)
		sum = a.reduce(:+)
		i += 1
	end
	a.push 10 - sum
	a
end

# puts drv_probs 4


def drv_vals(n)
	a = []
	n.times do |i|	
		if i == 0 then
			a.push rand(5) * sign
		else
			a.push rand(1..3) + a[i-1]
		end
	end
	a
end


def prob
	flt = (1..9).map { |e| e / 10.0 }.shuffle.pop
	prc = (1..19).map { |e| 5 * e }.shuffle.pop
	fracs = []
	(3..9).each do |denom|
		(1..denom-1).each do |num| 
			g = num.gcd denom
			fracs << [num / g, denom / g]
		end
	end
	frc = fracs.shuffle.pop

	flt_p = "$#{flt.to_s.sub '.', '{,}'}$"
	prc_p = "$#{prc}\\%$"
	frc_p = "$#{frc[0]}/#{frc[1]}$"

	{
		flt: flt_p,
		frc: frc_p,
		proc: prc_p
	}
end


def lgeq
	list = [
		'ровно',
		'не менее чем',
		'не более чем',
		'хотя бы',
		'по крайней мере',
		'по меньшей мере',
		'более чем',
		'менее чем',
	]

	list.shuffle.pop
end



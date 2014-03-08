# -*- coding: utf-8 -*-

include Math
require_relative 'floats_fracs'

def probs(n, base, vars = 'abcdef')
	a, sum, tex = [], 0, ''

	0.upto n-2 do |i|
		max = base - sum - n + i
		a << if a.include? 0
			rand(1...max)
		else
			rand(0...max)
		end

		sum = a.reduce(:+)
	end

	a << base - sum
	a.map!.with_index do |el, i|
		if el == 0
			nil
		elsif base == 10
			"0{,}#{el} #{vars[i]}"
		else
			"#{Rational(el, base).tex} #{vars[i]}"
		end
	end.compact!
		
	a.join(' + ')
end

# p probs(3, 7, 'xyzuv')




def drv_probs(n, base=10)	
	a = []
	sum = 0
	i = 0
	while i < n-1 do
		max = base + 1 - sum - n + i
		a.push rand(1..max)
		sum = a.reduce(:+)
		i += 1
	end
	a.push base - sum
	a.map { |e| base == 10 ? "0{,}#{e}" : Rational(e, base).tex }
end

# puts drv_probs 3, rand(4 .. 9)


def drv_vals(n)
	a = []
	n.times do |i|	
		if i == 0 then
			a << rand(5) * sign
		else
			a << rand(1..3) + a[i-1]
		end
	end
	a
end

# print drv_vals 4

def table(vals, probs, hdr_col: true, align: 'r')
	n = vals.length
	"\\begin{tabular}{*{#{ hdr_col ? n+1 : n}}{ >{$} #{align} <{$} }} 
		#{ hdr_col ? 'x_i &' : ''} #{vals.map { |e| "%6s " % e }.join("&")} \\\\ 
		#{ hdr_col ? 'p_i &' : ''} #{probs.map { |e| "%6s " % e }.join("&")} 
	\\end{tabular}"
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



def drv_cdf(name: 'x', m: rand(2..4))
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



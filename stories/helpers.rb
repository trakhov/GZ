# -*- coding: utf-8 -*-

def open_tmpl(path)
	open("#{Dir.pwd}/tmpl/" + path) { |file| file.readlines.shuffle!.pop }
end

def write(n, name)
	file = open("#{Dir.pwd}/generated/"+name, 'w')
	n.times do |i|
		# newline = i < n-1 ? "\n" : ""
		file.write generate
	end
	file.close
	puts "#{name} is written"
end

def sign
	rand < 0.5 ? 1 : -1
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

# print prob


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

# puts drv_vals 4

def frac(num, den)
	if num % den == 0
		num/den
	else
		Rational num, den
	end
end

# puts frac 3, 4
# puts frac 6, 3
# puts frac 1, 2

def tex_frac(r)
	n = r.numerator
	d = r.denominator

	if d == 1
		"#{n}"
	else
		if n * d < 0
			"-\\frac{#{n.abs}}{#{d.abs}}"
		else
			"\\frac{#{n}}{#{d}}"
		end
	end
end

# puts tex_frac(Rational 2, -3)
# puts tex_frac(Rational 4, 1)
# puts tex_frac(Rational 3, 9)

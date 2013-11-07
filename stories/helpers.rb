# -*- coding: utf-8 -*-

def open_tmpl(path)
	open(path) { |file| file.readlines.shuffle!.pop }
end

def write(n, name)
	file = open('./'+name, 'w')
	n.times do |i|
		# newline = i < n-1 ? "\n" : ""
		file.write generate
	end
	file.close
	puts 'done'
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

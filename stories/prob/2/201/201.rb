# -*- coding: utf-8 -*-
# ДСВ, функция распределения -> ряд распределения

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def dist_row(name='X')
	m = rand(3..5)
	data = [
		name,
		m,
		drv_vals(m).join(' & '),
		drv_probs(m).map { |s| '0{,}%d' % s }.join(' & ')
	]
	'$$ %s = \left(\begin{array}{*{%d}}{c}} %s \\\\ %s \end{array}\right).$$' % data
end

# puts dist_row

def options(name='x', m=rand(2..4))
	list_probs = (1..9).map { |e| '0{,}%d' % e }
	
	probs = ['0', '1']	
	m.times { probs << list_probs.shuffle!.pop }
	probs.sort!

	values = drv_vals(m+1)

	tex = 'F(x) = \begin{cases}%s, & x \leqslant %s \\\\ ' % [probs[0], values[0]]
	m.times do |i|
		tex += '%s, & %s < x \leqslant %s \\\\ ' % [
			probs[i+1], values[i], values[i+1]
		]		
	end
	tex += '%s, & x > %s \end{cases}' % [probs[-1], values[-1]]
	tex
end


write 100
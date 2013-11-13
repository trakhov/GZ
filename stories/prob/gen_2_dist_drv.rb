# -*- coding: utf-8 -*-

require_relative '../helpers'

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

def dist_func_drv(name='x', m=rand(2..4))
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

# print dist_func_drv

def generate 
	tmpl = open_tmpl './tmpl_2_dist_drv'
	tmpl % dist_func_drv
end

write 100, '2_dist_drv.txt'


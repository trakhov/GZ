# -*- coding: utf-8 -*-

def write(n)	
	file = open(
		"./generated/#{$glob_name}.txt", 'w', encoding: 'utf-8'
		)
	tmpl = open(
		"./tmpl/tmpl_#{$glob_name}", encoding: 'utf-8'
		) { |file| file.readlines }
	lines = tmpl.length
	written = 0

	while written < n
		tmpl.shuffle!
		lines.times do |i| 
			file.write(coin(tmpl[i]) % options) 
			written += 1
		end
	end

	file.close
	puts "#{$glob_name} is written"
end



#########################################

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

def from_range(range)
	range.map { |e| e }.shuffle.pop
end


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


def coin(txt)
	re1 = /\%(\d?)\%([^\%]+)\%\%/
	# re2 = /r(\d?)\%([^\%]+)\%r/
	while re1.match(txt) != nil
		mch1, num = re1.match(txt)[0..-1]
		re2 = /-#{num}\%([^\%]+)\%\%/

		ary1 = re1.match(txt)[2].split('|')
		chosen, index = ary1.map { |e| [e, ary1.index(e)] }.shuffle!.pop

		txt.gsub! mch1, chosen

		if re2.match(txt)
			mch2 = re2.match(txt)[0]
			ary2 = re2.match(txt)[1].split('|')
			txt.gsub! mch2, ary2[index]
		end
	end

	txt
end


# puts coin 'В поисках %%затонувшего|подскочившего|обычного%% корабля в заливе Аур, капитан осведомился о количестве иных r%затонувших|подскочивших|обычных%r кораблей.'

# puts coin '%1%a|b|c%% or %2%1|2|3%% puts r2%11|22|33%r or r1%A|B|C%r'

# puts(/(\d+).*([Bb]oo)/.match('234 dfkj boo dlsfk Boo')[2])

# puts coin 'boo %%A|B|C%% foo %1%8/9|7/8|6/7|5/6|4/5%% bobo dof odof 1/-1%9|8|7|6|5%%'


# def pluralize(txt)
# 	re = /plur/


# Сегодня мы выловили всего-навсего !!!%%4|5%%???рыбеш???ек???ки!!!

# data = open('./prob/tmpl/tmpl_06') { |file| file.readlines }

# data.each do |line|
# 	puts line
# 	puts ''
# 	puts coin line
# 	puts ''
# 	puts ''
# end

# puts coin 'выбирают %1%три|пять%% монет-1%ы| %% или брегет-1%а|ов%%'
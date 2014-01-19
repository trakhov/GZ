# -*- coding: utf-8 -*-

def write(n)	
	dir = "#{$glob_name[0]}/#{$glob_name}"
	name = if Dir.pwd.match dir
		"#{$glob_name}"
	else
		"#{dir}/#{$glob_name}"
	end

	file = open("#{name}.txt",	'w')
	tmpl = open("#{name}.tml") { |file| file.readlines }
	lines = tmpl.length
	written = 0

	while written < n
		tmpl.shuffle!
		lines.times do |i| 
			file.write((coin tmpl[i]) % options) 
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


def from_range(range)
	range.map { |e| e }.shuffle.pop
end


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


def coin(original)
	txt = original.dup
	re1 = /\%(\d?)\%([^\%]+)\%\%/
	while re1.match(txt) != nil
		mch1, num = re1.match(txt)[0..-1]
		re2 = /-#{num}\%([^\%]+)\%\%/

		ary1 = re1.match(txt)[2].split('|')
		chosen, index = ary1.map { |e| [e, ary1.index(e)] }.shuffle!.pop

		txt.gsub! mch1, chosen

		while re2.match(txt) != nil
			mch2 = re2.match(txt)[0]
			ary2 = re2.match(txt)[1].split('|')
			txt.gsub! mch2, ary2[index]
		end
	end

	txt
end


# 10.times { puts coin 'В поисках %%затонувшего|подскочившего|обычного%% корабля в заливе Аур капитан осведомился о количестве иных -%затонувших|подскочивших|обычных%% кораблей.'}

# puts coin '%1%a|b|c%% or %2%1|2|3%% puts r2%11|22|33%r or r1%A|B|C%r'

# puts(/(\d+).*([Bb]oo)/.match('234 dfkj boo dlsfk Boo')[2])

# puts coin 'boo %%A|B|C%% foo %1%8/9|7/8|6/7|5/6|4/5%% bobo dof odof 1/-1%9|8|7|6|5%%'

# p coin 'boo %2%1|2|3%% %1%a|b|c%% -1%AA|BB|CC%% -2%11|22|33%% -1%AAA|BBB|CCC%%'


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

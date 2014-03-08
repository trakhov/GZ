# -*- coding: utf-8 -*-

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
	elsif n * d < 0
		"-\\frac{#{n.abs}}{#{d.abs}}"
	else
		"\\frac{#{n}}{#{d}}"
	end
end

# puts tex_frac(Rational 2, -3)
# puts tex_frac(Rational 4, 1)
# puts tex_frac(Rational 3, 9)


class Float
	def tex
		to_s.split('.').join('{,}')
	end
end

class Fixnum
	def tex
		to_s
	end
end


class Rational
	def tex
		"\\frac{#{numerator}}{#{denominator}}"
	end
end

# p Rational(3,5).tex

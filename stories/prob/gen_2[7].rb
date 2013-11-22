# -*- coding: utf-8 -*-

require_relative '../helpers'

def options
	a = rand(-4..4)
	b = a + rand(1..5)
	x = a + rand(1..9) * (b-a) / 10.0
	p = rand(1..9)
	q = 10 * (10 - p)

	quantile = [
		"квантиль $x_{0{,}#{p}}$",
		"$#{q}\\%$-ную точку",
		"медиану"
	].shuffle!.pop

	mds = [
		'математическое ожидание $M(X)$',
		'дисперсию $D(X)$',
		'среднее квадратическое отклонение $\sigma_X$'
	].shuffle!.pop

	{
		a: a,
		b: b,
		mds: mds,
		x: x.round(1).to_s.sub('.', '{,}'),
		quantile: quantile
	}
end

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[7]'
	tmpl % options
end

# puts generate
write 100, '2[7].txt'
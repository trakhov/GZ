# -*- coding: utf-8 -*-

require_relative '../helpers'

def options
	m = [16, 20, 25, 40, 50, 80, 100, 125].shuffle!.pop
	lambda = 1.0/m

	t = 0
	while t * lambda < 0.1 || t * lambda > 3
		t = rand(2..15) * 10
	end

	event1 = [
		'среднее время',
		'дисперсию времени',
		'среднее квадратическое отклонение времени',
		'математическое ожидание времени'
	].shuffle!.pop

	ne = [
		'',
		'не'
	].shuffle!.pop

	{
		lambda: lambda, 
		t: t,
		event1: event1,
		ne: ne
	}
end

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[8]'
	tmpl % options
end

# puts generate
write 100, '2[8].txt'
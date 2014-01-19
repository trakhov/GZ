# -*- coding: utf-8 -*-
# показательная св, функция надежности

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

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


write 100
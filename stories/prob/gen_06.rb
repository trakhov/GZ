# -*- coding: utf-8 -*-

require_relative '../helpers'

def options

	{
		mM: ,

		task: 'Найдите для этой случайной величины: \\ \quad а) ряд распределения (и постройте полигон); \\ \quad б) функцию распределения (и постройте ее график); \\ \quad в) математическое ожидание; \\ \quad в) дисперсию и среднее квадратическое отклонение, а также найдите математическое ожидание, дисперсию, стандартное отклонение.',
	}
end

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[8]'
	tmpl % options
end

# puts generate
write 100, '2[8].txt'
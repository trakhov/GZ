# -*- coding: utf-8 -*-
### самое простое ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

join __FILE__, 
	'matr_lop', # линейные операции над матрицами
	'matr_mul', # умножение матриц
	generate: true
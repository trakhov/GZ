# -*- coding: utf-8 -*-
### самое простое ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

clue __FILE__, 
	'matr_lop', # линейные операции над матрицами
	'matr_mul', # умножение матриц
	'matr_det', # определители 3x3
	generate: true
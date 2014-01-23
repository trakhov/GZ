# -*- coding: utf-8 -*-
### самое простое ###  

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

clue __FILE__, 
	'111', # линейные операции над матрицами
	'112', # умножение матриц
	'121', # определители 3x3
	generate: true
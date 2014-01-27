# -*- coding: utf-8 -*-
### самое простое ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

clue_rb __FILE__, 
	'111', # линейные операции над матрицами
	'112', # умножение матриц
	'121', # определители 3x3
	generate: true
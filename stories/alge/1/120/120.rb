# -*- coding: utf-8 -*-
### самое простое ###  

Dir.glob('helpers/*.rb').each { |helper| require File.expand_path(helper) }

clue __FILE__, 
	'111', # линейные операции над матрицами
	'112', # умножение матриц
	'121', # определители 3x3
	generate: true
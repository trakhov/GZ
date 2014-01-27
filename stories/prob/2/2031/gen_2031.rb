# -*- coding: utf-8 -*-
# разные законы распределения 

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

clue_rb __FILE__, 
	'203',
	'207',
	# '208',
	'209',
	'210',
	generate: true

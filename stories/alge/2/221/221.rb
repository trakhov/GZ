# -*- coding: utf-8 -*-
### простейшее уравнение прямой ###  

[
	'../helpers',
	# 'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	a = (-9..9).map { |e| e }.shuffle
	
	{
		a: "( #{a[0]} ; #{a[1]} )",
		b: "( #{a[2]} ; #{a[3]} )",
		c: "( #{a[4]} ; #{a[5]} )",
		s: "\\{ #{a[6]} ; #{a[7]} \\}"
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, true
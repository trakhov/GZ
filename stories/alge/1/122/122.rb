# -*- coding: utf-8 -*-
### определители 4x4 ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	matrix = nil
	loop do
		matrix = Matrix.build(4) { rand(-5..5) }
		break if matrix.small?
	end
	
	{
		vmatrix: matrix.tex('v'),
		pmatrix: matrix.tex,
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, true
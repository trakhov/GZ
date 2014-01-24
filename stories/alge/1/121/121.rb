# -*- coding: utf-8 -*-
### определители 3x3 ###  

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	matrix = nil
	loop do
		matrix = Matrix.build(3) { rand(-5..5) }
		break if matrix.small?
	end
	
	{
		vmatrix: matrix.tex('v'),
		pmatrix: matrix.tex,
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
# -*- coding: utf-8 -*-
### определители 3x3 ###  

Dir.glob('helpers/*.rb').each { |helper| require File.expand_path(helper) }

def options
	matrix = nil
	loop do
		matrix = Matrix.build(3) { rand(-9..9) }
		break if matrix.small?
	end
	
	{
		vmatrix: matrix.tex('v'),
		pmatrix: matrix.tex,
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
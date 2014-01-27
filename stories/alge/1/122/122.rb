# -*- coding: utf-8 -*-
### определители 4x4 ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

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

write 60, __FILE__
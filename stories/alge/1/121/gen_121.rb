# -*- coding: utf-8 -*-
### определители 3x3 ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	matrix = nil
	while true
		matrix = Matrix.build(3) { rand(-5..5) }
		break if matrix.small?
	end
	
	{
		vmatrix: matrix.tex(type: 'v'),
		pmatrix: matrix.tex,
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
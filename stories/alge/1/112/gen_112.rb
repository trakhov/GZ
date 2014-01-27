# -*- coding: utf-8 -*-
### умножение матриц ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	m = ['3333', '1333', '2332', '3331'].shuffle.pop
	
	{
		matrix1: Matrix.build(m[0].to_i, m[1].to_i) { rand(-5..5) }.tex,
		matrix2: Matrix.build(m[2].to_i, m[3].to_i) { rand(-5..5) }.tex
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
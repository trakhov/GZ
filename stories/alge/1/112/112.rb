# -*- coding: utf-8 -*-
### умножение матриц ###  

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	m = ['3333', '1333', '2332', '3331'].shuffle.pop
	
	{
		matrix1: Matrix.build(m[0].to_i, m[1].to_i) { rand(-9..9) }.tex,
		matrix2: Matrix.build(m[2].to_i, m[3].to_i) { rand(-9..9) }.tex
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
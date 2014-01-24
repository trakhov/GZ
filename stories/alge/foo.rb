# -*- coding: utf-8 -*-



# p __FILE__.match(/(.*GZ)/)[1]


Dir.glob(File.join(/(.*GZ)/.match(__FILE__)[1], 'helpers', '*.rb')) { |h| require h }


a = Matrix.build(3) { rand(-5..5) }
b = Matrix.build(3,1) { rand(-5..5) }

a1, a2, a3 = (0..2).map do |j|
	columns = a.column_vectors
	columns[j] = b.column(0)
	Matrix.columns columns 
end


p [a1, a2, a3].all? { |e| e.small? }
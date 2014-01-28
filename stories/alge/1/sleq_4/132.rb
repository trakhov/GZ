# -*- coding: utf-8 -*-
### система уравнений 4x4 ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }


def options
	hash = {}
	names = ['xx', 'yy', 'aa', 'xyzt', 'abcd'].shuffle.pop

	while true
		a = Matrix.build(4) { rand(-7..7) }
		x = Matrix.build(4,1) { rand(-8..8) }
		b = a * x

		# a1, a2, a3, a4 = (0..3).map do |j|
		# 	cols = a.column_vectors
		# 	cols[j] = b.column(0)
		# 	Matrix.columns cols
		# end

		if a.regular? and [b].all? { |e| e.small? }
			matrix = Matrix.columns(a.t.to_a + b.t.to_a)
			hash[:eqs] = matrix.eqs(names: names)
			break
		end
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
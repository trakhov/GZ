# -*- coding: utf-8 -*-
### система уравнений 3x3 ###  

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	hash = {}

	while true
		a = Matrix.build(3) { rand(-7..7) }
		x = Matrix.build(3,1) { rand(-5..5) }
		b = a * x

		if a.regular? and b.small?
			matrix = Matrix.columns(a.t.to_a + b.t.to_a)
			hash[:eqs] = matrix.eqs
			break
		end
	end

	hash
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
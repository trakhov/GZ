# -*- coding: utf-8 -*-
### система уравнений 4x4 ###  

Dir.glob('helpers/*.rb').each { |helper| require File.expand_path(helper) }

def options
	hash = {}
	names = ['xx', 'xyzt', 'yy'].shuffle.pop

	while true
		a = Matrix.build(4) { rand(-7..7) }
		x = Matrix.build(4,1) { rand(-8..8) }
		b = a * x

		if a.regular? and b.small?
			matrix = Matrix.columns(a.t.to_a + b.t.to_a)
			hash[:eqs] = matrix.eqs(names: names)
			break
		end
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
# -*- coding: utf-8 -*-
### обратная матрица ###  

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	hash = {}

	while true
		m = Matrix.build(3) { rand(-5..5) }
		if m.regular?
			adj = m.inv * m.det
			if adj.small?
				hash[:matrix] = m.tex				
				break
			end
		end
	end

	hash
end



# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
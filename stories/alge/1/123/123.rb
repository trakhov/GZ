# -*- coding: utf-8 -*-
### обратная матрица ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

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

write 60, true
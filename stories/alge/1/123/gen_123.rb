# -*- coding: utf-8 -*-
### обратная матрица ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	hash = {}

	while true
		m = Matrix.build(3) { rand(-5..5) }
		if m.regular? and (m.inv * m.det).small?
			hash[:matrix] = m.tex				
			break
		end
	end

	hash
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
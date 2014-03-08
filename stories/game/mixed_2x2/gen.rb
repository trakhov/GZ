# -*- coding: utf-8 -*-
## минимакс в смешанных стратегиях ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	while true
		m = Matrix.build(2) { rand -5..5 }
		break if !m.saddle? && !m.dom?
	end

	{ matrix: m.tex }
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 7, __FILE__

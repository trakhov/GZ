# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }


def options
	size = [[2,3], [3,2], [2,4], [4,2]].sample

	while true
		m = Matrix.build(*size) { rand(-5..5) }
		if ! m.saddle? and ! m.dom?
			break
		end
	end
	
	{ matrix: add_bad_to(m).tex }
end


# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

# print options[:matrix]

write 50, __FILE__

# -*- coding: utf-8 -*-
## графическое решение (семинар) ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def create_matrix	
	while true
		size = [[3,2], [4,2], [2,3], [2,4]].sample

		m = Matrix.build(*size) { rand -5..5 }
		if !m.dom? && !m.saddle?
			return add_bad_to(m).tex
		end
	end
end
	

def options
	h = Hash.new
	10.times do |i|
		h["matrix#{i}".to_sym] = create_matrix
	end
	h
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 1, __FILE__


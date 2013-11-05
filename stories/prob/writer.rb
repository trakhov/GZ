# -*- coding: utf-8 -*-

def write(n, name)
	file = open('./'+name, 'w')
	n.times do |i|
		# newline = i < n-1 ? "\n" : ""
		file.write generate
	end
	file.close
end

# -*- coding: utf-8 -*-

def write(n, name)
	file = open('./'+name, 'w')
	n.times do |i|
		# newline = i < n-1 ? "\n" : ""
		file.write generate
	end
	file.close
	puts 'done'
end

def sign
	rand < 0.5 ? 1 : -1
end

def lgeq
	list = [
		'ровно',
		'не менее',
		'не более',
		'хотя бы',
		'по крайней мере',
		'по меньшей мере',
		'более',
		'менее',
	]

	list.shuffle.pop
end

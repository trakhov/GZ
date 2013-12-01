# -*- coding: utf-8 -*-

# require_relative 'main_helpers'

$nums = [
	['discipl', '80200.65', 'Service'],
	['foobar', '100100.62', 'MiEND'],
	# ['', '', ''],
]

############################################


$tmpl_data = open("./tmpl_data") { |file| file.read }
$tmpl_tex = open("./tmpl_tex") { |file| file.read }

$nums.each do |course|
	data = open("./data/#{course[0]}", 'w')	
	lines = open("./data/#{course[0]}.txt") { |f| f.readlines }
	tasks = (0..lines.length/2).map { |i| [lines[i], lines[-i-1]] }
	tasks.each do |task|
		data.write($tmpl_data % task)
	end
	data.close

	data = open("./data/#{course[0]}") { |f| f.read }
	out = open("./tex/#{course[0]}.tex", 'w')
	out.write($tmpl_tex % {
		disc: course[0],
		spec: course[1],
		kafedra: course[2],
		data: data
		})
	out.close
end

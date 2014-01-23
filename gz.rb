# -*- coding: utf-8 -*-

require_relative 'main_helpers'
# require 'date'

$nums = ['132', '223', '235', '122', '224', '237']
$no = 2
$typ = 'exam'
$chapter = 'alge'
$template = 'grade45(6)'

############################################

$fullname = "#{$typ}_#{$chapter}"
if $no != '' then $fullname += "_#{$no}" end

p "fullname: #{$fullname}"

$tmpl = open("./templates/#{$typ}/#{$template}") do |file| 
	file.read 
end

open("./data/#{$fullname}.tex", 'w') do |file| 
	prepare 60, file
end

tex = open("./#{$typ}_#{$chapter}.tex", 'w') do |file|
	tmpl = open("./templates/#{$typ}/main") { |tmpl| tmpl.read }
	file.write(tmpl % {
		proc: '%',
		tex: "data/#{$fullname}",
		dzn: $no,
	})
end

puts "done, #{$typ}_#{$no} is written"
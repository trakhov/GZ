# -*- coding: utf-8 -*-

require_relative 'main_helpers'
# require 'date'

$nums = ['101', '102', '104', '105', '106', '1030', '200', '2021', '2031', '302'].sort
$no = ''
$typ = 'exam'
$chapter = 'prob'
$template = '10'

############################################

$fullname = "#{$typ}_#{$chapter}"
if $no != '' then $fullname += "_#{$no}" end

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
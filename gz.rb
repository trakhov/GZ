# -*- coding: utf-8 -*-

require_relative 'main_helpers'
require 'date'

$nums = ['010', '011', '012']
$no = 3
$typ = 'kr'
$chapter = 'prob'
$template = '3'

############################################


$tmpl = open("./templates/#{$typ}/#{$template}") do |file| 
	file.read 
end

open("./data/#{$typ}_#{$chapter}_#{$no}.tex", 'w') do |file| 
	prepare 60, file
end

tex = open("./#{$typ}_#{$chapter}.tex", 'w') do |file|
	tmpl = open("./templates/#{$typ}/main") { |tmpl| tmpl.read }
	file.write(tmpl % {
		proc: '%',
		tex: "data/#{$typ}_#{$chapter}_#{$no}",
		dzn: $no,
	})
end

puts "done, #{$typ}_#{$no} is written"
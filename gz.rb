# -*- coding: utf-8 -*-

require_relative 'main_helpers'
require 'date'

$nums = ['06', '07', '08', '09']
$no = 2
$typ = 'kr'
$chapter = 'prob'

############################################


$tmpl = open("./templates/#{$typ}/#{$nums.length}") do |file| 
	file.read 
end

open("./data/#{$typ}_#{$chapter}_#{$no}.tex", 'w') do |file| 
	prepare 60, $chapter, $tmpl, $nums, file
end

tex = open("./#{$typ}_#{$chapter}.tex", 'w') do |file|
	tmpl = open("./#{$typ}_tex_tmpl") { |tmpl| tmpl.read }
	file.write(tmpl % {
		proc: '%',
		tex: "data/#{$typ}_#{$chapter}_#{$no}",
		dzn: $no,
	})
end

puts "done, #{$typ}_#{$no} is written"
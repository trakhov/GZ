# -*- coding: utf-8 -*-
# разные законы распределения 

$glob_name = /(\d+)\./.match(__FILE__)[1]



$out = open("#{$glob_name}.txt", 'w')
$data = []

[
	'203',
	'207',
	# '208',
	'209',
	'210',
].each do |num|
	$data += open("../#{num}/#{num}.txt") { |file| file.readlines }
end

$out.write($data.shuffle.join)

$out.close

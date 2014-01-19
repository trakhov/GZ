# -*- coding: utf-8 -*-
# метод наибольшего правдоподобия

[
	'helpers',
	'prob/stat_helpers',	
	# 'prob/prob_helpers',
	'prob/distributions'
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]



def options
	m = rand(5..40) * 10
	out = {}
	['expo', 'bino', 'pois', 'geom', 'star'].each do |dist|
		d = eval "T_#{dist.capitalize}.new(#{m})"
		out["#{dist}_n".to_sym] = d.wash.sum
		out["#{dist}".to_sym] = d.tex
	end

	out
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100

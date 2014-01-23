# -*- coding: utf-8 -*-
### система неравенств ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	points = []
	while points.length < 5
		p = 2.times.map { |e| rand(-9..9) }
		if !points.include? p
			points << p
		end
	end

	hash = {}

	[:a, :b, :c, :d, :e].each.with_index do |p, i|
		hash[p] = "( #{points[i].join(' ; ')} )"
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, true


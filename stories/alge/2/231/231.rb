# -*- coding: utf-8 -*-
### уравнение плоскости ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	hash = {}
	
	[:a, :b, :c, :n].each do |name|
		ary = Array.new(3) { |i| rand(-9..9) }
		if name == :n
			hash[name] = "\\{ #{ary.join(' ; ')} \\}"
		else
			hash[name] = "( #{ary.join(' ; ')} )"
		end
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, true
# -*- coding: utf-8 -*-
### точка пересечения прямых ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	hash = {}
	
	while true
		a = Matrix.build(2,2) { rand(2..9) }
		x = Matrix.build(2,1) { rand(-9..9) }
		b = a * x

		if a.regular? and b.small?
			m = Matrix.columns(a.t.to_a + b.t.to_a)
			break
		end
	end

	[:eq1, :eq2].each do |key|
		i = key.to_s[-1].to_i - 1
		hash[key] = "%d x + %d y = %d" % [m[i,0], m[i,1], m[i,2]]
	end

	hash
end

# options.each { |k, v| print "#{k}: #{v}\n" }

# opts = options
# print opts[:eq1] + "\n"
# print opts[:eq2] + "\n"

write 60, true
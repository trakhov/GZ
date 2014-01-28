# -*- coding: utf-8 -*-
### точка пересечения прямых ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

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

write 50, __FILE__
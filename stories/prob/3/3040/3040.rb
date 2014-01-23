# -*- coding: utf-8 -*-
# метод наибольшего правдоподобия

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }



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

write 60, __FILE__

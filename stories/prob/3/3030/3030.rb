# -*- coding: utf-8 -*-
# метод моментов

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

class Float
	def int
		s = self.to_s
		mch = s.match(/(\d*)\.0/)
		mch ? self.to_i : self.round(2)
	end
end

def options
	m = rand(5..40) * 10
	out = {}

	['expo', 'bino', 'pois', 'geom', 'norm', 'unif'].each do |dist|
		d = eval "T_#{dist.capitalize}.new(#{m})"
		out["#{dist}".to_sym] = d.tex
		out["#{dist}_n".to_sym] = d.sum
		out["#{dist}_nu1".to_sym] = d.nu1.int
		out["#{dist}_nu2".to_sym] = d.nu2.int
		out["#{dist}_mu2".to_sym] = d.mu2.int
	end

	out
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
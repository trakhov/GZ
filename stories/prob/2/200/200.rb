# -*- coding: utf-8 -*-

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	n = rand(4..5)
	vals = drv_vals n
	probs = drv_probs n
	
	{
		drv: table(vals, probs),
		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
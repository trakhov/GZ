# -*- coding: utf-8 -*-

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	n = rand(4..5)
	vals = drv_vals n
	probs = drv_probs n
	
	{
		drv: table(vals, probs),
		
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__
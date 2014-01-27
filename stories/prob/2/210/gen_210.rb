# -*- coding: utf-8 -*-
# геометрическая св

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	n = (4..10).map { |e| e }.shuffle!.pop
	p = (1..9).map { |e| e/10.0 }.shuffle!.pop
	
	{
		p_bern: prob.values.shuffle!.pop,
	}
end

write_rb 50, __FILE__
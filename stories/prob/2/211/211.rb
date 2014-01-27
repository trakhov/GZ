# -*- coding: utf-8 -*-
# неравенство Маркова

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	t = Proc.new { (5..8).map { |e| e }.shuffle.pop }	
	c = Proc.new { "#{t.call}#{t.call}".to_i }
	
	{
		t1: t.call,
		t2: t.call, 
		c1: c.call,
		proc: '\%',
	}
end

write 60, __FILE__
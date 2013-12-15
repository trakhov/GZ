# -*- coding: utf-8 -*-

['../helpers', './prob_helpers'].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

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

write 100
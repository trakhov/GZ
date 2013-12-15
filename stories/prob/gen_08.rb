# -*- coding: utf-8 -*-

['../helpers', './prob_helpers'].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	
	{
		proc: '\%',		
	}
end

write 100
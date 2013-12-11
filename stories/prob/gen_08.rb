# -*- coding: utf-8 -*-

require_relative '../helpers'

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	
	{
		proc: '\%',		
	}
end

write 100
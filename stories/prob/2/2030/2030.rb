# -*- coding: utf-8 -*-
# нормальный закон распределения

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	
	{
		proc: '\%',		
	}
end

write 60, __FILE__
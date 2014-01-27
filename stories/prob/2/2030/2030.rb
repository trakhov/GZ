# -*- coding: utf-8 -*-
# нормальный закон распределения

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		proc: '\%',		
	}
end

write 60, __FILE__
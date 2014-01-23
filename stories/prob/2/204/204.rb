# -*- coding: utf-8 -*-
# показательное распределение: параметр, вероятность матож

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options
	lambda = rand(2..15)
	p2 = (rand(4.0 / lambda) + 0.05).round 2

	{
		lambda: lambda, 
		p2: "#{p2.to_s.sub '.', '{,}'}"
	}
end

write 60, __FILE__
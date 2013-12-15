# -*- coding: utf-8 -*-

['../helpers', './prob_helpers'].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	lambda = rand(2..15)
	p2 = (rand(4.0 / lambda) + 0.05).round 2

	{
		lambda: lambda, 
		p2: "#{p2.to_s.sub '.', '{,}'}"
	}
end

write 100
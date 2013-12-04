# -*- coding: utf-8 -*-

require_relative '../helpers'

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	lambda = rand(2..15)
	# p1 = lambda - (lambda + rand(1..lambda/2) * sign)
	p2 = (rand(4.0 / lambda) + 0.05).round 2

	{
		lambda: lambda, 
		# p1: p1, 
		p2: "#{p2.to_s.sub '.', '{,}'}"
	}
end


write 100
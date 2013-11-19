# -*- coding: utf-8 -*-

require_relative '../helpers'

def options
	lambda = rand(2..15)
	# p1 = lambda - (lambda + rand(1..lambda/2) * sign)
	p2 = lambda + rand(1..lambda/2) * sign

	{
		lambda: lambda, 
		# p1: p1, 
		p2: p2
	}
end

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[4]'
	tmpl % options
end

# puts generate
write 100, '2[4].txt'
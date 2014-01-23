# -*- coding: utf-8 -*-
### произвольная задача в пространстве ###  

require 'matrix'

[
	'../helpers',
	'matrix_helpers',
].each { |helper| require_relative "../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	
	{
		proc: '\%',
		
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 60, true
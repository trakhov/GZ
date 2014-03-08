# -*- coding: utf-8 -*-

chapter = 'game'		# alge, calc, prob, game
num = 'bi_2x2_and_2x3'
title = 'две биматричные игры: 2x2 и 3x2 (2x3)'

#################################

gen = <<eos
# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		
	}
end

# options.each { |o| print "\#{o[0]}: \#{o[1]}\\n" }

# write 50, __FILE__
eos

inp = <<eos
[
'task',

]
eos

wdir = /(.*GZ)/.match(File.expand_path $0)[1]

Dir.chdir("#{wdir}/stories/#{chapter}")

def create_dirs(*args)
	if args == [] then return end
	dir = args[0]
	if ! Dir.exists? dir 
		Dir.mkdir dir 
	end
	Dir.chdir dir 
	create_dirs(*args[1..-1])
end

create_dirs(*num.split('/'))


File.open("in.rb", "w") { |f| f.write inp }
File.open("gen.rb", "w") { |f| f.write gen % {title: title}}
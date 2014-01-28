# -*- coding: utf-8 -*-

$chapter = 'alge'		# alge, calc, prob, game
$num = '171'
$title = 'название'

#################################

$tmpl = <<eos
# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	
	{
		proc: '\\%%',		
	}
end

# options.each { |o| print "\#{o[0]}: \#{o[1]}\\n" }

# write 50, __FILE__
eos

$wdir = /(.*GZ)/.match(File.expand_path $0)[1]

Dir.chdir("#{$wdir}/stories/#{$chapter}")

def create_dirs(*args)
	if args == [] then return end
	dir = args[0]
	if ! Dir.exists? dir 
		Dir.mkdir dir 
	end
	Dir.chdir dir 
	create_dirs(*args[1..-1])
end

create_dirs($num[0], $num)


File.open("in_#{$num}.rb", "w") {  }
File.open("gen_#{$num}.rb", "w") { |f| f.write $tmpl }
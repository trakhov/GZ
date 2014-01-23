# -*- coding: utf-8 -*-

$chapter = 'alge'		# alge, calc, prob, game
$num = '171'
$title = 'название'

$tmpl =<<eos
# -*- coding: utf-8 -*-
### %{title} ###  

Dir.glob('helpers/*.rb').each { |h| require File.expand_path(h) }

def options
	
	{
		proc: '\\%%',		
	}
end

# options.each { |o| print "\#{o[0]}: \#{o[1]}\\n" }

# write 60, __FILE__
eos


Dir.chdir(File.join 'stories', $chapter)

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


File.open("#{$num}.tml", "w") {  }
File.open("#{$num}.rb", "w") { |f| f.write $tmpl }
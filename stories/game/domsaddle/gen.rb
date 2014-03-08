# -*- coding: utf-8 -*-
## антагонизм: доминирование и седло ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	while true
		m = Matrix.build(3) { rand -5..5 }
		break if !m.dom? && m.saddle?
	end

		m = add_bad_to m
	
	{	matrix: m.tex(table: false) }
end

# options.each { |o| print "#{o[0]}: \n#{o[1]}\n" }

write 7, __FILE__

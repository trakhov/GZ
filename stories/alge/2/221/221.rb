# -*- coding: utf-8 -*-
### простейшее уравнение прямой ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	a = (-7..7).map { |e| e }.shuffle
	
	{
		a: "( #{a[0]} ; #{a[1]} )",
		b: "( #{a[2]} ; #{a[3]} )",
		c: "( #{a[4]} ; #{a[5]} )",
		s: "\\{ #{a[6]} ; #{a[7]} \\}"
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__
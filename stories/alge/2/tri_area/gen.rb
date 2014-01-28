# -*- coding: utf-8 -*-
### площадь треугольника ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	a = (-9..9).map { |e| e }.shuffle
	
	{
		a: "( #{a[0]} ; #{a[1]} )",
		b: "( #{a[2]} ; #{a[3]} )",
		c: "( #{a[4]} ; #{a[5]} )",
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__
# -*- coding: utf-8 -*-
# формула полной вероятности и формула Байеса

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options

	{
		a: rand(5..12),
		b: rand(5..12),
		c: rand(5..12),
		d: rand(5..12),
		m: rand(2..3),
		n: rand(2..5),
	}
end

write 60, __FILE__
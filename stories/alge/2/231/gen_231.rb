# -*- coding: utf-8 -*-
### уравнение плоскости ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	hash = {}
	
	[:a, :b, :c, :n].each do |name|
		ary = Array.new(3) { |i| rand(-9..9) }
		if name == :n
			hash[name] = "\\{ #{ary.join(' ; ')} \\}"
		else
			hash[name] = "( #{ary.join(' ; ')} )"
		end
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
# -*- coding: utf-8 -*-
### система неравенств ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	points = []
	while points.length < 5
		p = 2.times.map { |e| rand(-9..9) }
		if !points.include? p
			points << p
		end
	end

	hash = {}

	[:a, :b, :c, :d, :e].each.with_index do |p, i|
		hash[p] = "( #{points[i].join(' ; ')} )"
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__
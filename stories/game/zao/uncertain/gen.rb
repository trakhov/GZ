# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	range = (10..30).map { |e| e }.shuffle
	demand = Array.new(4) { range.pop * 10 }.sort

	probs = drv_probs(4)

	p = rand(4..8)
	l = p - rand(2..3)
	a = "0{,}#{rand 1..9}"
	
	{
		demand: demand.join(' & '),
		probs: probs.join(' & '),
		lpa: [l, p, a].join(' & ')
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__

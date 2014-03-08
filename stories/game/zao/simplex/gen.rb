# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options	
	while true
		good = Matrix.build(3) { rand(1..5) }
		if !good.saddle? and !good.dom?
			break
		end
	end

	bad = add_bad_row good
	
	quarters = [1.0, 2.0, 2.5, 1.6, 0.8, 0.5, 0.4, 0.25, 1.25]
	costs = Matrix.build(3,1) { rand 10..50 }
	prices = Matrix.build(4,1) { quarters.shuffle!.pop }

	m = Matrix.build(4,3) do |i, j| 
		((bad[i,j] + costs[j,0]) / prices[i,0]).round(4)
	end

	{
		product: m.tex(align: 'c'),
		prices: prices.tex(align: 'c'),
		costs: costs.tex(align: 'c')
	}
end

# options.each { |o| print "#{o[0]}: \n#{o[1]}\n" }

write 50, __FILE__

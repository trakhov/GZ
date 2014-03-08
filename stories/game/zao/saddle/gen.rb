# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }


def shares(ary1, ary2)
	out = []
	ary1.each do |p1|
		ary2.each do |p2|
			sh = p1 > p2 ? 5 * rand(6..10) : 5 * rand(10..16)
			out << "#{p1}\t& #{p2}\t& #{sh}\\%\t"
		end
	end
	out.join(" \\\\ \n")
end

def progs(prices, cogs)
	prices.map.with_index do |el, i|
		"#{'I' * (i+1)}\t& #{el}\t& #{cogs[i]}\t "
	end.join(" \\\\ \n")
end


def options

	while true
		g_prices, w_prices = 2.times.map do
			prices = (10..20).map { |e| e }
			Array.new(3) { prices.shuffle!.pop }.sort
		end
		if g_prices != w_prices
			break
		end
	end

	g_cogs, w_cogs = [g_prices, w_prices].map do |prices|
		prices.map { |e| e - rand(3..5) }
	end

	{
		grapple: progs(g_prices, g_cogs),
		windle: progs(w_prices, w_cogs),
		shares: shares(g_prices, w_prices),
		c: 5 * rand(5..10),
		d: (0.1 * rand(5..15)).round(2).tex
	}
end

# options.each { |o| print "#{o[0]}:\n#{o[1]}\n" }

write 50, __FILE__


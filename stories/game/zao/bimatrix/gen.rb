# -*- coding: utf-8 -*-
## %{title} ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options		
	prem = rand 1..5
	otk = (prem / 10.0) * rand(1..3)

	while true
		n = 100 * rand(1..5)
		price = (otk / 5.0) * rand(2..4)
		prob = 0.1 * rand(4..8)
		penlt = (prem / 20.0) * rand(2..5)
		if n * (prob * penlt - price) > 0
			break
		end
	end

	{
		n: n,
		a: prem,
		b: otk.round(2).tex,
		v: price.round(2).tex,
		p: prob.round(2).tex,
		w: penlt.round(2).tex
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__

# count = 0
# 1000.times do
# 	m1, m2 = 2.times.map { Matrix.build(2) { rand -5..5} }
# 	if bi_good? m1, m2
# 		count += 1
# 	end
# end
# p count


# def bi_good?(m1, m2)
# 	c = m1[0,0] + m1[1,1] - m1[0,1] - m1[1,0]
# 	d = m2[0,0] + m2[1,1] - m2[0,1] - m2[1,0]

# 	a = m1[1,1] - m1[0,1]
# 	b = m2[1,1] - m2[1,0]

# 	one = (a.abs <= c.abs and a * c > 0)
# 	two = (b.abs <= d.abs and b * d > 0)

# 	one and two
# end


# while true
# 	m1, m2 = 2.times.map { Matrix.build(2) { rand -5..5} }
# 	if bi_good? m1, m2
# 		break
# 	end
# end

# {matrix1: m1, matrix2: m2}
# -*- coding: utf-8 -*-

require './writer'

def params
	squares = (4..30).map { |a| a**2 }
	poisson_probs = (1..50).map { |a| a/1000.0 }
	laplace_probs = (1..9).map { |a| a/10.0 }

	laplace = Hash.new { |h, k| h[k] = [] }

	laplace_probs.each do |p|
		squares.each do |sq| 
			n = sq / (p - p**2)
			if n % 10 < 0.001 and !laplace[p].include? n.round
				laplace[p].push n.round
			end
		end
	end

	poisson = Hash.new { |h, k| h[k] = [] }
	
	lambdas = (1..9).map { |a| a/10.0 } + (1..11).to_a
	poisson_quantities = laplace.values.reduce { |a, b| a + b }.uniq
	poisson_probs.each do |p|
		poisson_quantities.each do |n|
			if lambdas.include? n * p
				poisson[p] = n
			end
		end
	end

	{laplace: laplace, poisson: poisson}
end

def generate
	tmpl = open("./tmpl_04") { |file| file.readlines.shuffle!.pop }
end

puts generate




# %{n}
# %{poissonP}
# %{laplaceP}
# %{lgeq} %{poissonM}
# %{gaussM}
# %{laplaceA} %{laplaceB}



# write 50 '04.txt'
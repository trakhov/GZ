# -*- coding: utf-8 -*-

require '../helpers'

puts sign

def near_np(np, npq)
	deltas = (1..5).map { |a| a / 20.0 }.shuffle
	Array.new(2) { np + sign * (deltas.pop * np).round }.sort
end

# puts near_np 50


def laplace
	squares = (4..30).map { |a| a ** 2 }
	probs = (10..90).map { |a| a / 100.0 }

	out = []

	probs.each do |p|
		squares.each do |sq|
			n = sq / (p - p ** 2)
			if n % 10 < 0.001 and !out.include? [n.round, p]				
				out << {
					n: n.round,
					p: p,
					# m: n * p + (rand < 0.5 ? rand())
				}
			end
		end
	end

	out
end

# print laplace


def poisson
	probs = (1..50).map { |a| a / 1000.0 }
	lambdas = (1..9).map { |a| a / 10.0 } + (1..11).to_a
end


def params
	squares = (4..30).map { |a| a**2 }
	poisson_probs = (1..50).map { |a| a/1000.0 }
	laplace_probs = (1..9).map { |a| a/10.0 }

	# laplace = Hash.new { |h, k| h[k] = [] }
	laplace = []

	laplace_probs.each do |p|
		squares.each do |sq| 
			n = sq / (p - p**2)
			if n % 10 < 0.001 and !laplace.include? [p, n.round]
				laplace << [n.round, p]
			# if n % 10 < 0.001 and !laplace[p].include? n.round
			# 	laplace[p] << n.round
			end
		end
	end

	poisson = Hash.new { |h, k| h[k] = [] }
	# poisson = []
	
	lambdas = (1..9).map { |a| a/10.0 } + (1..11).to_a
	# poisson_quantities = laplace.values.reduce { |arr1, arr2| arr1 + arr2 }.uniq
	poisson_quantities = laplace.map { |arr| arr[1] }.uniq
	poisson_probs.each do |p|
		poisson_quantities.each do |n|
			if lambdas.include? n * p
				# poisson[p] << n
				# poisson << [p, n]
				poisson[n] << p
			end
		end
	end

	{laplace: laplace, poisson: poisson}
end

# puts params

def generate
	tmpl = open("./tmpl_04") { |file| file.readlines.shuffle!.pop }
end

# puts generate




# %{n}
# %{poissonP}
# %{laplaceP}
# %{lgeq} %{poissonM}
# %{gaussM}
# %{laplaceA} %{laplaceB}



# write 50 '04.txt'
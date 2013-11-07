# -*- coding: utf-8 -*-

require '../helpers'

def country
	list = [
		'Швамбрании',
		'Уганды',
		'Французской Полинезии',
		'Штатов Египетского Дождя',
		'Северной Нарнии',
		'Левобережья Евфрата',
		'Островов Крокодилова Клюва',
		'Атлантиды',
		'Мордора',
		'Студландии-2'
	]
	list.shuffle.pop
end

def date
	months = [
		['января', 31],
		['февраля', 28],
		['марта', 31],
		['апреля', 30],
		['мая', 31],
		['июня', 30],
		['июля', 31],
		['августа', 31],
		['сентября', 30],
		['октября', 31],
		['ноября', 30],
		['декабря', 31],
	]

	m = months.shuffle.pop

	"#{rand(1..m[1])} #{m[0]}"
end


def near_np(n, p)
	arr = []
	m = 0
	np, sq = [n * p, Math.sqrt(n * p * (1 - p))]
	deltas = (2..15).map { |a| (a * np / 100.0).round }

	2.times do |i|
		j = 1
		until ((m - np) / sq).abs < 3 && !arr.include?(m.round)
			m = np + sign * deltas.shuffle.pop
			j += 1
			if j > 100
				break
			end
		end
		arr << m.round
	end
	arr.sort! << (np + sign * deltas.shuffle.pop).round
	arr
end

def create_laplace
	squares = (4..30).map { |a| a ** 2 }
	probs = (10..90).map { |a| a / 100.0 }

	out = Hash.new { |hash, key| hash[key] = [] }

	probs.each do |p|
		squares.each do |sq|
			n = sq / (p - p ** 2)
			if n % 10 < 0.001	
				near = near_np n, p
				out[n.round] << {
					# n: n.round,
					p: "$#{p.to_s.sub '.', '{,}'}$",
					a: near[0],
					b: near[1],
					m: near[2]
				}
			end
		end
	end

	out
end

# create_laplace.each do |hash|
# 	puts hash
# end


def create_poisson(laplace)
	probs = (10..500).map { |a| a / 10000.0 }
	lambdas = (3..9).map { |a| a / 10.0 } + (1..9).to_a

	# quantities = laplace.map { |hash| hash[:n] }.uniq.shuffle
	quantities = laplace.keys.uniq

	out = Hash.new { |hash, key| hash[key] = [] }

	quantities.each do |n|	
		probs.shuffle.each do |p|
			lambda = n * p
			if (lambdas.include? n * p)
				out[n] << {
					p: "$#{p.to_s.sub '.', '{,}'}$",
					q: "$#{(1-p).to_s.sub '.', '{,}'}$",
					m: rand(2..5),
					proc: "$#{(p * 100).round(8).to_s.sub '.', '{,}'}\\%$"
				}
			else
			end
		end
	end

	out
end

# puts create_poisson create_laplace



def generate
	tmpl = open("./tmpl_04") { |file| file.readlines.shuffle!.pop }

	params = create_laplace
	poissoned = create_poisson params

	n = poissoned.keys.shuffle.pop

	laplace = params[n].shuffle.pop
	poisson = poissoned[n].shuffle.pop

	tmpl % {
		n: n,
		laplaceP: laplace[:p],
		laplaceA: laplace[:a],
		laplaceB: laplace[:b],
		gaussM: laplace[:m],
		poissonP: poisson[:p],
		poissonQ: poisson[:q],
		poissonM: poisson[:m],
		poissonPr: poisson[:proc],
		lgeq: lgeq,
		country: country,
		date: date
	}
end

# puts generate

write 50, '04.txt'
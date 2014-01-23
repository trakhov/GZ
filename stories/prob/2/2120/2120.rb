# -*- coding: utf-8 -*-
# закон больших чисел

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def chebyshov(n, p)
	mx = n * p
	var = n * p * (1 - p)
	sigma = Math.sqrt(var).round 1

	eps = ((rand + rand(1..3)) * sigma).round
	a, b = [mx.round - eps, mx.round + eps]

	{
		p: "#{p.round(2)}".gsub('.', '{,}'),
		p_proc: (p * 100).round,
		mx: mx.round,
		var: var.round,
		sigma: sigma,
		eps: eps,
		a: a,
		b: b,
		a_proc: (100.0 * a / n).round,
		b_proc: (100.0 * b / n).round,
	}
end
	


def options
	n = (20..80).map { |e| e }.shuffle.pop * 10 ** rand(1..2)
	# n_big = n_small * 10 ** rand(1..2)

	p_small = (5..8).map { |e| e / 100.0 }.shuffle.pop
	p_big = p_small * 10

	trust = (90..97).map { |e| e }.shuffle.pop

	ch_small = chebyshov n, p_small
	ch_big = chebyshov n, p_big

	hash = Hash.new
	ch_small.each { |k, v| hash["#{k}_small".to_sym] = v }
	ch_big.each { |k, v| hash["#{k}_big".to_sym] = v }

	hash[:n] = n
	hash[:trust] = trust
	hash[:proc] = '\%'	

	hash
end

write 60, __FILE__
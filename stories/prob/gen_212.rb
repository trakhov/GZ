# -*- coding: utf-8 -*-

require_relative '../helpers'

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	t = (2..9).map { |e| e }.shuffle.pop
	n = (20..70).map { |e| e }.shuffle.pop * 10 ** rand(1..2)
	mx = n * t / 100.0
	variance = n * t * (10 - t) / 1000.0
	sigma = Math.sqrt(variance)
	# delta = Proc.new { ((rand() + rand(2..3)) * sigma) }
	delta = (rand() + rand(2..3)) * sigma

	
	{
		p_big: ["0{,}#{100-t}", "#{100-t} \\%"].shuffle.pop,
		p_small: ["0{,}0#{t}", "#{t} \\%"].shuffle.pop,
		n: n,
		delta: delta.round, #.call.round,
		a: (mx.round - delta).round,
		b: (mx.round + delta).round,
		a_proc: (((mx - delta) / n) * 100).round,
		b_proc: (((mx + delta) / n) * 100).round,
		mx: mx.round,
		d: variance.round,
		proc: '\%'
	}
end

write 100
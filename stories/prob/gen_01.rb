# -*- coding: utf-8 -*-

require_relative '../helpers'


def generate
	tmpl = open_tmpl 'tmpl_01'

	prob_type = rand < 0.5 ? :flt : :frc

	tmpl % {
		nN: rand(15..25),
		mM: rand(5..15),
		n: rand(5..10),
		m: rand(2..4),
		p: prob[prob_type],
		p1: prob[prob_type],
		p2: prob[prob_type],
		p3: prob[prob_type],
		p4: prob[prob_type],		
		rand1: rand(5..15),
		rand2: rand(5..15),
		rand3: rand(5..15),
		rand4: rand(5..15),
		rand5: rand(5..15),
		rand6: rand(5..15),
		lgeq: lgeq
	}
end

# puts generate

write 100, '01.txt'
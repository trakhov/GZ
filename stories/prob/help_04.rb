# -*- coding: utf-8 -*-

require '../helpers'

def generate
	tmpl = open_tmpl './tmpl_04'

	winner = rand(3..6)
	loser = rand(1..winner-1)

	tmpl % {
		n: rand(5..9),
		m: rand(2..4),
		p: prob[rand < 0.5 ? :flt : :frc],
		proc: prob[:proc],
		wballs: rand(3..6),
		bballs: rand(3..6),
		rainydays: rand(1..9) * 3,
		denom: rand(4..7),
		winner: winner,
		loser: loser,
		lgeq: lgeq
	}
end

# puts generate

# write 50, './04.txt'
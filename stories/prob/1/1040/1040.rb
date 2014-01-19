# -*- coding: utf-8 -*-
# формула Бернулли

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]


def options
	winner = rand(3..6)
	loser = rand(1..winner-1)

	{
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

write 100
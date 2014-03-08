# -*- coding: utf-8 -*-
## биматричная игра 2x2 (доминирование в смесях) ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }


def options

	mix1 = probs(3, rand(4..10), 'abc')
	mix2 = probs(3, rand(4..10), 'xyz')

	game = Game.build_dom nash: true
	
	{game: game.tex, mix1: mix1, mix2: mix2}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__


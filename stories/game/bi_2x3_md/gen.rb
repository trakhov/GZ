# -*- coding: utf-8 -*-
## биматричная игра 2x3 или 3x2 (доминирование в смесях) ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def create_23_or_32

	params = [
		{size: [2, 3], to_add: 'row'},
		{size: [3, 2], to_add: 'col'}
	].sample

	while true
		a, b = 2.times.map { Matrix.build(*params[:size]) { rand -9..9 } }
		game = Game.new(a, b)
		
		game.add_weak(params[:to_add]) if !game.dom_pure? && !game.dom?

		break if game.size == [3, 3] && !game.dom_pure? && game.dom?
	end

	game
end


def options

	mix1 = probs(3, rand(4..10), 'abc')
	mix2 = probs(3, rand(4..10), 'xyz')

	game = create_23_or_32
	
	{game: game.tex, mix1: mix1, mix2: mix2}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__


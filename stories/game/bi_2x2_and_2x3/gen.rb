# -*- coding: utf-8 -*-
## биматричная игра 2x3 или 3x2 (доминирование в смесях) ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def create_2x3
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


def create_2x2
	params = ['row', 'col'].shuffle

	while true
		a, b = 2.times.map { Matrix.build(2) { rand -9..9 } }
		game = Game.new(a, b)

		if !game.dom_pure?
			game.add_weak(params[0])
			game.add_weak(params[1])
		end

		break if !game.dom_pure?
	end

	game
end	


def options
	game1 = create_2x3
	game2 = create_2x2
	
	{game1: game1.tex, game2: game2.tex}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__


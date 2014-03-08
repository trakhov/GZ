

require 'minitest/autorun'

Dir.glob("../helpers/*.rb") { |file| require_relative file }



class TestNash < Minitest::Test

	def test_nash
		skip 'later'

		a = Matrix[
			[6, 1], [0, 1]
		]

		b = Matrix[
			[-2, 9], [3, -3]
		]

		game = Game.new a, b

		assert_equal true, game.nash_pure?
	end


	def test_with_non_dom
		skip 'later'
		
		game1 = Game.build_non_dom
		game2 = Game.build_non_dom nash: false

		game23 = Game.build_non_dom 2, 3
		game32 = Game.build_non_dom 3, 2

		game3 = Game.build_non_dom nash: true		

		assert_equal false, game1.nash_pure?
		assert_equal false, game2.nash_pure?
		assert_equal true, game3.nash_pure?

		assert_equal false, game23.nash_pure?
		assert_equal false, game32.nash_pure?

	end

	def test_with_dom
		skip 'later'

		game22 = Game.build_dom 
		game23 = Game.build_dom from: [2, 3]
		game32 = Game.build_dom from: [3, 2]

		game22n = Game.build_dom nash: true
		game23n = Game.build_dom from: [2, 3], nash: true
		game32n = Game.build_dom from: [3, 2], nash: true

		assert_equal false, game22.nash_pure?
		assert_equal false, game23.nash_pure?
		assert_equal false, game32.nash_pure?

		assert_equal true, game22n.nash_pure?
		assert_equal true, game23n.nash_pure?
		assert_equal true, game32n.nash_pure?

	end
end





class TestMatrixDominances < Minitest::Test

	def test_strongly_weak_cols
		skip 'later'

		one = Matrix[
			[0, 4], 
			[1, 2], 
			[2, 5]
		]

		two = Matrix[
			[2, 1, 3],
			[3, 0, 1],
			[5, -1, 1]
		]

		assert_equal Hash['row' => Set.new([0, 1]), 'col' => Set.new([0])], one.dom_pure?
		assert_equal Hash['col' => Set.new([1])], two.dom_pure?
	end


	def test_weakly_weak_rows
		# skip 'later'

		fails = 0

		100.times do
			game = Game.build_non_dom
			fails += 1 if !game.add_weak('row').dom_mix?
		end

		assert_equal 0, fails		
	end


	def test_weakly_weak_cols
		skip 'later'

		fails = 0

		100.times do
			game = Game.build_non_dom
			fails += 1 if !game.add_weak('col').dom_mix?			
		end

		assert_equal 0, fails
	end

end




class TestArraysComparison < Minitest::Test

	def test_proper_lt
		skip 'later'

		assert_equal true, [1,2,3] < [2,3,4]
		assert_equal true, [-1,-2,-3] < [1,2,3]
		assert_equal false, [1,2,3] < [2,0,1]
	end

	def test_proper_gt
		skip 'later'

		assert_equal true, [1,2,3,4] > [0,1,-3,-4]
		assert_equal false, [1,2,3,4] > [0,1,2,5]
	end

end



class TestBimatrix < Minitest::Test

	def test_non_dom
		skip 'later'

		game = Game.build_non_dom

		assert_equal false, game.dom_pure?
	end	


	def test_dom_22
		skip 'later'

		fails = 0

		100.times do
			game = Game.build_dom

			if row = game.dom_mix?('row')
				until row.empty?
					game.remove_row row.pop
				end

				fails += 1 if !game.dom_mix?
			end

			# if col = game.dom_mix?('col')
			# 	until col.empty?
			# 		game.remove_col col.pop
			# 	end

			# 	fails += 1 if !game.dom_mix?
			# end
		end

		assert_equal 0, fails
	end


	def test_dom_23
		skip 'later'

		fails = 0

		100.times do
			game = Game.build_dom from: [2, 3]
			if !game.dom?
				fails += 1
			end
		end

		assert_equal 0, fails
	end


	def test_dom_32
		skip 'later'

		fails = 0

		100.times do
			game = Game.build_dom from: [3, 2]
			if !game.dom?
				fails += 1
			end
		end

		assert_equal 0, fails
	end


	def test_dom_nash
		skip 'later'

		game = Game.build_dom nash: true

		assert_equal true, game.nash_pure?
	end
end


class TestRemovalOfStrategies < Minitest::Test

	def test_remove_row
		# skip 'later'

		a = Matrix[
			[1, 2, -3],
			[-2, 4, 0],
			[5, -1, -1]
		]

		b = Matrix[
			[-2, 3, 0],
			[-5, 5, 0],
			[-1, -1, 0]
		]

		game = Game.new(a, b).remove_row 0
		assert_equal Matrix[[-2, 4, 0], [5, -1, -1]], game.a
		assert_equal Matrix[[-5, 5, 0], [-1, -1, 0]], game.b

		game = Game.new(a, b).remove_row 1
		assert_equal Matrix[[1, 2, -3], [5, -1, -1]], game.a
		assert_equal Matrix[[-2, 3, 0], [-1, -1, 0]], game.b

		game = Game.new(a, b).remove_row 2
		assert_equal Matrix[[1, 2, -3], [-2, 4, 0]], game.a
		assert_equal Matrix[[-2, 3, 0], [-5, 5, 0]], game.b
	end


	def test_remove_col
		# skip 'later'

		a = Matrix[
			[1, 2, -3],
			[-2, 4, 0],
			[5, -1, -1]
		]

		b = Matrix[
			[-2, 3, 0],
			[-5, 5, 0],
			[-1, -1, 0]
		]

		game = Game.new(a, b).remove_col 0
		assert_equal Matrix[[2, -3], [4, 0], [-1, -1]], game.a
		assert_equal Matrix[[3, 0], [5, 0], [-1, 0]], game.b

		game = Game.new(a, b).remove_col 1
		assert_equal Matrix[[1, -3], [-2, 0], [5, -1]], game.a
		assert_equal Matrix[[-2, 0], [-5, 0], [-1, 0]], game.b

		game = Game.new(a, b).remove_col 2
		assert_equal Matrix[[1, 2], [-2, 4], [5, -1]], game.a
		assert_equal Matrix[[-2, 3], [-5, 5], [-1, -1]], game.b
	end




end
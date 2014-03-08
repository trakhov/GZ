# -*- coding: utf-8 -*-

require 'matrix'




class LP

	attr_accessor :obj, :res, :to

	def initialize
		yield self if block_given?
	end
	

	def canonize
		@res.to_a.each do |row|
			case row[-1]
			when '<='
				@res = Matrix.columns @res.t.to_a.insert(-2)
			end
					
		end
	end




end


# z = LP.new do |lp|
# 	lp.obj = Vector[1, 2, 3, -4]
# 	lp.to = 'max'
# 	lp.res = Matrix[
# 		[1, -2, 3, 0, '<=', 5],
# 		[-1, 3, 0, 2, '>=', 2],
# 		[0, 3, -2, 4, '<=', 3]
# 	]
# end



# p z


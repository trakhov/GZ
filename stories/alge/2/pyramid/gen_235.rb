# -*- coding: utf-8 -*-
### пирамида ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	points = [
		[[3,4,5], [1,2,1], [-2,-3,6], [3,-6,-3]],
		[[-7,-5,6], [-2,5,-3], [3,-2,4], [1,2,2]],
		[[1,3,1], [-1,4,6], [-2,-3,4], [3,4,-4]],
		[[2,4,1], [-3,-2,4], [3,5,-2], [4,2,-3]],
		[[-5,-3,-4], [1,4,6], [3,2,-2], [8,-2,4]],
		[[3,4,2], [-2,3,-5], [4,-3,6], [6,-5,3]],
		[[-4,6,3], [3,-5,1], [2,6,-4], [2,4,-5]],
		[[7,5,8], [-4,-5,3], [2,-3,5], [5,1,-4]],
		[[3,-2,6], [-6,-2,3], [1,1,-4], [4,6,-7]],
		[[-5,-4,-3], [7,3,-1], [6,-2,0], [3,2,-7]],
		[[3,-5,-2], [-4,2,3], [1,5,7], [-2,-4,5]],
		[[7,4,9], [1,-2,-3], [-5,-3,0], [1,-3,4]],
		[[-4,-7,-3], [-4,-5,7], [2,-3,3], [3,2,1]]
	].shuffle.pop

	hash = {}

	[:a, :b, :c, :d].each.with_index do |p, i|
		hash[p] = "( #{points[i].join(' ; ')} )"
	end

	hash
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 50, __FILE__
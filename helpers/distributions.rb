# -*- coding: utf-8 -*-

require 'distribution'

include Math
include Distribution::Shorthand


def geom_pdf(x, p)
	p * (1-p) ** (x-1)
end

def star_pdf(x, q)
	q**2*(1-q)**(x-1)
end

class Dist
	attr_reader :sum, :vals, :probs
	def initialize(sum)
		@sum = sum
	end

	def name
		self.class.name.match(/T_(.*)/)[1].downcase
	end

	def wash
		diff = @sum - @probs.reduce(:+)
		if diff.abs < 4
			@probs[@probs.index @probs.max] += diff
		end

		@vals.keep_if { |e| @probs[@vals.index e] > 0 }
		@probs.keep_if { |e| e > 0 }
		@sum = @probs.reduce :+

		self
	end

	def tex		
		wash
		table @vals, @probs
	end
end


class T_Bino < Dist
	attr_accessor :pr, :nu1, :nu2, :mu2
	def initialize(sum)
		super(sum)
		@pr = rand
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (sum * bino_pdf(e,10,@pr)).round }

		@nu1 = 10.0 * @pr
		@mu2 = 10.0 * @pr * (1-@pr)
		@nu2 = @mu2 + @nu1**2
	end	
end


class T_Pois < Dist
	attr_accessor :lambda, :nu1, :nu2, :mu2
	def initialize(sum)
		super(sum)
		@lambda = rand(10..30)/10.0
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * pois_pdf(e, @lambda)).round }		

		@nu1 = @lambda
		@nu2 = @lambda + @lambda**2
		@mu2 = @lambda
	end	
end

class T_Geom < Dist
	attr_accessor :p, :nu1, :nu2, :mu2
	def initialize(sum)
		super sum
		@p = rand(30..70)/100.0
		@vals = (1..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * geom_pdf(e, @p)).round }

		@nu1 = 1.0/@p
		@nu2 = (2.0-@p)/@p**2
		@mu2 = (1.0-@p)/@p**2
	end
end

class T_Star < Dist
	attr_accessor :q, :nu1, :nu2, :mu2
	def initialize(sum)
		super sum
		@q = rand(30..70)/100.0
		@vals = (1..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * star_pdf(e, @q)).round }


		@nu1, @nu2, @mu2 = [0, 0, 0]
	end
end


class T_Expo < Dist
	attr_accessor :lambda, :nu1, :nu2, :mu2
	def initialize(sum)
		super sum
		@lambda = rand(50..100)/100.0
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * expo_pdf(e, @lambda)).round }

		@nu1 = 1.0/@lambda
		@nu2 = 2.0/@lambda**2
		@mu2 = 1.0/@lambda**2
	end
end

class T_Norm < Dist
	attr_accessor :a, :s, :nu1, :nu2, :mu2
	def initialize(sum)
		super sum
		@a = 10.0**rand(2) * rand(10..15)
		@s = rand(@a/6.0..@a/3.0)
		@vals = (1..8).map { |e| rand(@a-3*@s..@a+3*@s).round }.uniq.sort
		@probs = @vals.map { |e| (sum*norm_pdf((e-@a)/@s.to_f)).round }

		@nu1 = @a
		@mu2 = @s**2
		@nu2 = @mu2 + @nu1**2
	end
end

class T_Unif < Dist
	attr_accessor :a, :b, :nu1, :nu2, :mu2
	def initialize(sum)
		@mu2 = 0
		while @mu2 <= 0
			super sum
			@a = rand(1..10) * 10.0**rand(2)
			@len = rand(1..3) * 10.0
			@b = @a + @len
			@vals = (1..10).map { |e| (@len * rand + @a).round }.uniq.sort
			@probs = @vals.map { |e| (sum*(1.0/@len) + rand(-5..5)).round }

			@nu1 = 0.5 * (@a + @b)
			@nu2 = 0.33 * (@a**2 + @a*@b + @b**2)
			@mu2 = @nu2 - @nu1**2
		end
	end
end


# ['bino', 'pois', 'geom', 'expo', 'norm', 'unif', 'star'].each do |dist|
# 	d = eval "#{dist} = T_#{dist.capitalize}.new(100)"
# 	d.wash
# 	p "******** #{d.name} ***********"
# 	p "vals: #{d.vals}"
# 	p "probs: #{d.probs}"
# 	p "nu1: #{d.nu1}"
# 	p "nu2: #{d.nu2}"
# 	p "mu2: #{d.mu2}"
# end

# p 3.5.int
# p 3.0.int

# expo = T_Expo.new(100)
# p expo.wash.type
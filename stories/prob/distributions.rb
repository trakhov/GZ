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
	def initialize(sum)
		@sum = sum
	end

	def wash
		diff = @sum - @probs.reduce(:+)
		if diff.abs < 4
			@probs[@probs.index @probs.max] += diff
		end

		@vals.keep_if { |e| @probs[@vals.index e] > 0 }
		@probs.keep_if { |e| e > 0 }

		{vals: @vals, probs: @probs, sum: @probs.reduce(:+)}
	end

	def tex
		wash		
		table @vals, @probs
	end
end


class T_Bino < Dist
	attr_accessor :pr, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super(sum)
		@pr = rand
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (sum * bino_pdf(e,10,@pr)).round }

		@nu_1 = 10 * @pr
		@mu_2 = 10 * @pr * (1-@pr)
		@nu_2 = @mu_2 + @nu_1**2
	end	
end


class T_Pois < Dist
	attr_accessor :lambda, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super(sum)
		@lambda = rand(10..30)/10.0
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * pois_pdf(e, @lambda)).round }		

		@nu_1 = @lambda
		@nu_2 = @lambda + @lambda**2
		@mu_2 = @lambda
	end	
end

class T_Geom < Dist
	attr_accessor :p, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super sum
		@p = rand(30..70)/100.0
		@vals = (1..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * geom_pdf(e, @p)).round }

		@nu_1 = 1.0/@p
		@nu_2 = (2.0-@p)/@p**2
		@mu_2 = (1.0-@p)/@p**2
	end
end

class T_Star < Dist
	def initialize(sum)
		super sum
		@q = rand(30..70)/100.0
		@vals = (1..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * star_pdf(e, @q)).round }
	end
end


class T_Expo < Dist
	attr_accessor :lambda, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super sum
		@lambda = rand(50..100)/100.0
		@vals = (0..10).map { |e| e }
		@probs = @vals.map { |e| (@sum * expo_pdf(e, @lambda)).round }

		@nu_1 = 1.0/@lambda
		@nu_2 = 2.0/@lambda**2
		@mu_2 = 1.0/@lambda**2
	end
end

class T_Norm < Dist
	attr_accessor :a, :s, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super sum
		@a = 10**rand(2) * rand(10..15)
		@s = rand(@a/6.0..@a/3.0).round		
		@vals = (1..8).map { |e| rand(@a-3*@s..@a+3*@s) }.uniq.sort
		@probs = @vals.map { |e| (sum*norm_pdf((e-@a)/@s.to_f)).round }

		@nu_1 = @a
		@mu_2 = @s**2
		@nu_2 = @mu_2 + @nu_1**2
	end
end

class T_Unif < Dist
	attr_accessor :a, :b, :nu_1, :nu_2, :mu_2
	def initialize(sum)
		super sum
		@a = rand(1..10) * 10**rand(2)
		@len = rand(1..3) * 10
		@b = @a + @len
		@vals = (1..10).map { |e| (@len * rand + @a).round }.uniq.sort
		@probs = @vals.map { |e| (sum*(1.0/@len) + rand(-5..5)).round }

		@nu_1 = 0.5 * (@a + @b)
		@nu_2 = 0.33 * (@a**2 + @a*@b + @b**2)
		@mu_2 = @nu_2 - @nu_1**2
	end
end

# p T_Unif.new(100).wash
# p T_Bino.new(200).wash
# p T_Pois.new(150).wash
# p T_Geom.new(100).wash
# p T_Star.new(200).wash
# p T_Expo.new(200).wash
# p T_Norm.new(300).wash

# eval "norm = T_Norm.new(100).wash"

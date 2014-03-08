# -*- coding: utf-8 -*-

require 'matrix'
require 'set'


class Array

	def <(other)
		raise ArgumentError, 'sizes differ' if size != other.size

		(0...size).all? { |i| self[i] < other[i] }
	end

	def >(other)
		raise ArgumentError, 'sizes differ' if size != other.size

		(0...size).all? { |i| self[i] > other[i] }
	end
end



class Matrix

	def saddle?		
		a = @rows.map { |row| row.min }.max
		b = @rows.transpose.map { |col| col.max }.min

		a == b
	end



	def dom_pure?(lines = ['row', 'col'], log: false)
		h = Hash.new { |hash, key| hash[key] = Set.new }

		[lines].flatten.each do |line|
			ary = line == 'row' ? @rows : @rows.transpose

			ary.each.with_index do |row1, i|
				ary.each.with_index do |row2, j|				
					if row1 < row2
						print "#{i+1} #{line} dominated by #{j+1}\n" if log
						h[line] << i
					end
				end
			end
			
		end

		h.empty? ? false : h
	end


	def size
		[@rows.size, @rows[0].size]
	end


	def dominance(i)
		fals = {gt: 1, lt: 0}

		return fals if column_count != 3

		h = {gt: 0, lt: 1}
		j, k = (i+1) % 3, (i+2) % 3

		to_a.each do |row|
			den = (row[j] - row[k]).to_f
			num = (row[i] - row[k]).to_f
			case 
			when den == 0
				h = fals if row[j] <= row[i]
			when den > 0
				h[:gt] = (num / den) if (num / den) > h[:gt]
			when den < 0
				h[:lt] = (num / den) if (num / den) < h[:lt]
			end
		end

		h
	end


	def dominated?(i, line='col', log: false)
		m = line == 'col' ? self : self.t
		h = m.dominance i

		bool = h[:gt] < h[:lt]

		print "#{i+1} #{line} is dominated if #{h[:gt]} < p < #{h[:lt]}\n" if log && bool

		i if bool
	end


	def dom_mix?(line, log: false)		
		max = case line
		when 'row' 
			size[1]
		when 'col'
			size[0]
		end

		bool = (0..max).map { |i| dominated?(i, line, log: log) }

		bool.compact if bool.any? { |e| e }
	end


end

# p Matrix[
# [-2, 2],
# [-3, 3],
# [-4, 5]].dom_mix? 'row', log: true


# m.dominated?(2, 'row', log: true)


# -*- coding: utf-8 -*-

require 'matrix'

class Matrix

	def tex(type: 'p', pretty: true)
		nl, tb = if pretty then ["\n", "\t"] else ['', ''] end
		max = self.max_by { |e| e.to_s.length }.to_s.length
		data = @rows.map do |row|
			row.map { |el| "%#{max}d" % el }.join(" & ")
		end.join(" \\\\ #{nl}#{tb}")

		"\\begin{#{type.to_s}matrix*}[r]#{nl}#{tb}" <<
		"#{data} #{nl}" <<
		"\\end{#{type.to_s}matrix*}"
	end


	def eqs(names: 'xx', pretty: true)
		nl, tb = if pretty then ["\n", "\t"] else ['', ''] end
		vars = @rows[0].length - 1
		data = @rows.map!.with_index do |row, j|
			row.map!.with_index do |el, i|
				if i < vars
					if names[0] == names[1]						
						"%10s " % "+ #{el} #{names[0]}_{#{i+1}}"
					else
						"%10s " % "+ #{el} #{names[i]}"
					end
				else
					"= #{el}"
				end
			end
				.join(" &{} ")
				.gsub(/\+(\s*)([-=])/, ' \2\1')
				.gsub(/^(\s*)\+/, ' \1')
				.gsub(/1 ([#{names}])/, '  \1')
				.gsub(/[-+ ] 0 [#{names}](_\{\d\})?/, " " * 9)
				.gsub(/^((\s*&{}\s*)+)\+/, '\1 ')
		end

		"\\left\\{\\!\\!\\begin{array}{*{#{vars}}{r @{}} l } #{nl}" <<
		"#{data.join(" \\\\ #{nl}")} #{nl}" <<
		"\\end{array}\\right."
	end


	def small?
		if self.square?
			self.det.abs < 40
		else 
			true
		end and		
		self.all? { |el| el.abs < 10 }
	end	


	def pprint
		lens = @rows.transpose.map do |col| 			
			col.max_by { |e| e.to_s.length }.to_s.length + 1 
		end
		s = "["
		@rows.each do |row|
			s += if row != @rows.first then " " else "" end
			row.each.with_index { |el, j| s += "%#{lens[j]}d" % el }
			s += if row == @rows.last then " ] \n" else " \n" end
		end
		print s
	end

end



# [
# 	[[1,2,3,4], [2,0,3,4],[0,0,3,4],[-1,3,4,0],[2,-1,0,5]]
# ].each do |rows|
# 	m = Matrix.rows rows
# 	m.pprint
# 	print m.eqs(pretty: true)
# end

# m = Matrix.build(3) { rand(-99..1150) }

# print m.tex#(pretty: true)
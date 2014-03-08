# -*- coding: utf-8 -*-

require 'matrix'

class Matrix

	def tex(type: 'p', align: 'r', pretty: true, table: false)
		nl, tb = if pretty then ["\n", "\t"] else ['', ''] end
		max = self.max_by { |e| e.tex.length }.tex.length
		data = @rows.map do |row|
			row.map { |el| "%#{max}s" % el.tex }.join(" & ")
		end.join(" \\\\ #{nl}#{tb}")

		if table
			return "#{tb}#{data} #{nl}"
		else
			return "\\begin{#{type.to_s}matrix*}[#{align}]#{nl}#{tb}" <<
			"#{data} #{nl}" <<
			"\\end{#{type.to_s}matrix*}"
		end
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
		@rows.each.with_index do |row, i|
			s += if i == 0 then "" else " " end
			row.each.with_index { |el, j| s += "%#{lens[j]}d" % el }
			s += if i == @rows.length-1 then " ] \n" else " \n" end
		end
		print s
	end

end
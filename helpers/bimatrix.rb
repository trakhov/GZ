# -*- coding: utf-8 -*-

require 'matrix'
require_relative 'matrix_helpers'
require_relative 'game_helpers'

STDOUT.sync = true


class Game

	attr_reader :a, :b

	def initialize(matrix1, matrix2)
		raise ArgumentError unless matrix1.size == matrix2.size

		@a = matrix1
		@b = matrix2
	end


	def size
		@a.size
	end


	def t
		Game.new @a.t, @b.t
	end


	def add_row(row)
		ind = rand 0..size[0]
		rnd_row = @a.row(0).map { rand -8..8 }

		@a = Matrix.rows @a.to_a.insert(ind, row)
		@b = Matrix.rows @b.to_a.insert(ind, rnd_row)	

		self
	end


	def add_col(col)
		ind = rand 0..size[1]
		rnd_col = @b.column(0).map { rand -8..8 }

		@a = Matrix.columns @a.t.to_a.insert(ind, rnd_col)
		@b = Matrix.columns @b.t.to_a.insert(ind, col)

		self
	end


	def remove_row(row)
		ary_a, ary_b = @a.to_a, @b.to_a
		[ary_a, ary_b].each { |ary| ary.delete_at row }

		@a = Matrix.rows ary_a
		@b = Matrix.rows ary_b

		self
	end


	def remove_col(col)
		ary_a, ary_b = @a.t.to_a, @b.t.to_a
		[ary_a, ary_b].each { |ary| ary.delete_at col }

		@a = Matrix.columns ary_a
		@b = Matrix.columns ary_b

		self
	end


	def add_weak(line='row')
		p = rand
		case line
		when 'row'
			weak = (p * @a.row(0) + (1-p) * @a.row(1)).map { |e| e.floor }
			add_row(weak)
		when 'col'
			weak = (p * @b.column(0) + (1-p) * @b.column(1)).map { |e| e.floor }
			add_col(weak)
		end			
	end


	def nash_pure
		equilibria = []
		@a.each_with_index do |a, i, j|
			b = @b[i, j]
			if a == @a.column(j).max && b == @b.row(i).max
				equilibria << {profile: [i, j], payoff: [a, b]}
			end
		end

		equilibria
	end


	def nash_pure?
		!nash_pure.empty?
	end


	def dom_pure?
		@a.dom_pure?('row') || @b.dom_pure?('col')
	end


	def dom_mix?(line = 'all', log: false)
		case line
		when 'row'
			return @a.dom_mix? 'row', log: log
		when 'col'
			return @b.dom_mix? 'col', log: log
		else
			return @b.dom_mix?('col', log: log) || @a.dom_mix?('row', log: log)
		end				
	end


	def pprint
		m = Matrix.build(@a.row_count, @a.column_count) { |i, j| [@a[i,j], @b[i,j]] }

		print m.to_a.map { |e| e.inspect }.join("\n")
			.gsub('[[', '[').gsub(']]', ']').gsub('[', '(').gsub(']', ')') + "\n"
	end


	def tex(name=nil)
		rows, cols = self.size
		abc, xyz = 'abcdefgh', 'xyzuvst'

		foo =<<-eos
\\begin{tabular}{
	c | 
%{preamble}
}
\\multicolumn{1}{c}{} &
%{first_line}
\\\\[6pt] \\cline{2-#{cols * 2 + 1}}
%{body}\\end{tabular}%{caption}
eos

		line = <<eos
	\\multirow{2}{.5cm}{$ %s $}
	&&%s \\\\
	&%s& \\\\ \\cline{2-#{cols * 2 + 1}}
eos

		preamble = cols.times.map do |i|
			"\t>{$} c <{$} @{\\;} >{$} r <{$} |"
		end.join("\n")

		first_line = cols.times.map do |i|
			"\\multicolumn{2}{c}{$ #{xyz[i]} $}"
		end.join(" &\n")

		body = rows.times.map do |i|
			line % [
				abc[i],
				@b.to_a[i].map { |e| "  %2d  " % e }.join('&&'),
				@a.to_a[i].map { |e| " %2d   " % e }.join('&&')
			]
		end.join

		caption = name ? "\\caption{#{name}}" : ''

		foo % {preamble: preamble, first_line: first_line, body: body, caption: caption}
	end


	class << self

		def build_non_dom(rows = 2, cols = 2, nash: false)

			nash_condition = lambda { |game| nash ? game.nash_pure? : !game.nash_pure? }

			while true
				# print '!'
				a, b = 2.times.map { Matrix.build(rows, cols) { rand -9..9 } }
				game = new a, b

				break if !game.dom_pure? && !game.dom_mix? && nash_condition.call(game)
			end

			game
		end


		def build_dom(from: [2, 2], nash: false)

			nash_condition = lambda { |game| nash ? game.nash_pure? : !game.nash_pure? }

			while true
				game = build_non_dom(*from, nash: nash)
				weak_lines = []
				(3 - from[0]).times { weak_lines << 'row' }
				(3 - from[1]).times { weak_lines << 'col' }
				weak_lines.shuffle!

				while !weak_lines.empty?
					game.add_weak weak_lines.pop
					break if game.dom_pure?
				end

				break if game.size == [3, 3] && !game.dom_pure? && game.dom_mix? && nash_condition.call(game)
			end

			game
		end

	end


end


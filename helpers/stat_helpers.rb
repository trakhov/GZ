# -*- coding: utf-8 -*-

def stat_probs(n, rel=true)	
	a = []
	sum = 0
	i = 0
	while i < n-1 do
		max = 21 - sum - n + i
			a << rand(1..max)
		sum = a.reduce :+
		i += 1
	end
	a << 20 - sum
	if rel
		a.map { |e| "#{e / 20.0}".gsub('.', '{,}') }
	else
		mult = rand(1..6)
		a.map { |e| e * mult }
	end
end

# print stat_probs 5
# puts
# print stat_probs 5, rel=false

def stat_vals(n)
	a = []
	mult = rand(1..5)
	n.times do |i|	
		if i == 0 then
			a << rand(2..10) * mult
		else
			a << rand(1..5) * mult + a[i-1]
		end
	end
	a
end

def len_vals(n)
	a = []
	n.times do |i|
		if i == 0 then
			a << rand(50..90)
		else
			a << rand(1..3) + a[i-1]
		end
	end
	a
end

# puts 
# print stat_vals 4

def table(vals, probs)
	n = vals.length
	rel = if probs[0].to_s.match(/\d+\{\,\}\d+/) then 'w' else 'n' end
	"\\begin{tabular}{*{#{n+1}}{ >{$} r <{$} }} " + \
	"x_i & #{vals.join(" & ")} \\\\ " + \
	"#{rel}_i & #{probs.join(" & ")} " + \
	"\\end{tabular}"
end

# puts table(stat_vals(4), stat_probs(4, false))
# puts table(stat_vals(4), stat_probs(4))
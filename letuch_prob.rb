# -*- coding: utf-8 -*-

# require_relative 'main_helpers'
require 'date'

$nums = [
	# '201', # ф-ция расп дсв -> ряд распределения
	# '202', # ф-ция расп нсв -> плотность, вероятность, графики
	# '203', # норм расп -> вероятность, квантиль, проц. т.
	# '204', # показ расп -> параметр, вероятность, матожидание
	# '205', # нсв -> мода, медиана, матожидание
	# '206', # нсв, дсв -> начальные и центральные моменты,
	# '207', # равномерная св -> матожидание, дисперсия, квантили, вероятность
	# '208', # показательная св, функция надежности
	# '209', # биномиальная св
	# '210', # геометрическая св
	'211', # неравенство Маркова
	'212', # неравенство Чебышёва
]

$options = {
	num: $nums.join('_'),
	questions: $nums.length,
}

############################################


$tmpl = open("./templates/let/#{$options[:questions]}", encoding: 'utf-8') { |file| file.read }

def generate_tasks
  tasks = Hash.new
  $nums.each do |t|
    tasks[t] = open("./stories/prob/generated/#{t}.txt", encoding: 'utf-8') { |f| f.readlines.reverse }
  end
  tasks
end

$tasks = generate_tasks

def prepare(n, f)
	tasks = generate_tasks
	n.times do
	  list = $nums.map { |t| tasks[t].pop }
	  f.write($tmpl % list )
	end
end

data = open("./data/letuch_prob_#{$options[:num]}.tex", 'w', encoding: 'utf-8') do |file|
	prepare 60, file	
end

tex = open("./letuch_prob.tex", 'w', encoding: 'utf-8') do |file|
	tmpl = open("./letuch_tex_tmpl") { |tmpl| tmpl.read }
	file.write(tmpl % {
		proc: '%',
		letuch: "data/letuch_prob_#{$options[:num]}"
	})
end

puts "done, letuch_#{$options[:num]} is written"
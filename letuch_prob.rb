# -*- coding: utf-8 -*-

# require_relative 'main_helpers'

$nums = [
	# '2[1]', # ф-ция расп дсв -> ряд распределения
	# '2[2]', # ф-ция расп нсв -> плотность, вероятность, графики
	# '2[3]', # норм расп -> вероятность, квантиль, проц. т.
	# '2[4]', # показ расп -> параметр, вероятность, матожидание
	# '2[5]', # нсв -> мода, медиана, матожидание
	# '2[6]', # нсв, дсв -> начальные и центральные моменты,
	'2[7]', # равномерная св -> матожидание, дисперсия, квантили, вероятность
	'2[8]', # показательная св, функция надежности
]

$options = {
	num: 131122,
	questions: 2,
}

############################################


$tmpl = open("./templates/let/#{$options[:questions]}") { |file| file.read }

def generate_tasks
  tasks = Hash.new
  $nums.each do |t|
    tasks[t] = open("./stories/prob/generated/#{t}.txt") { |f| f.readlines.shuffle! }
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

data = open("./data/letuch_prob_#{$options[:num]}.tex", 'w')

prepare 60, data

data.close

puts "done, letuch_#{$options[:num]} is written"
# -*- coding: utf-8 -*-

# require_relative 'main_helpers'

$nums = [
	'2_dist_drv', # ф-ция расп дсв -> ряд распределения
	'2_dist_crv', # ф-ция расп нсв -> плотность, вероятность, графики
]

$tmpl = open('./templates/let/a5_02') { |file| file.read }

def generate_tasks
  tasks = Hash.new
  $nums.each do |t|
    tasks[t] = open("./stories/prob/#{t}.txt") { |f| f.readlines.shuffle! }
  end
  tasks
end

$tasks = generate_tasks

def prepare(f)
  list = $nums.map { |t| $tasks[t].pop }
  f.write($tmpl % list )
end

data = open("./data/letuch_prob_5.tex", 'w')

60.times { prepare data }

data.close

puts 'done'
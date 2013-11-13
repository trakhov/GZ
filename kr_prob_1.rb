# -*- coding: utf-8 -*-

require_relative 'main_helpers'

$nums = [
	'01', # сложение и умножение вероятностей
	'02', # задача о встрече
	'03', # полная вероятность и формула Байеса
	'04', # формула Бернулли
	'05', # формулы Пуассона и Муавра-Лапласа
]

$tmpl = open('./templates/kr/a4_05') { |file| file.read }

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

data = open("./data/kr_prob_1.tex", 'w')

60.times { prepare data }

data.close

puts 'done'
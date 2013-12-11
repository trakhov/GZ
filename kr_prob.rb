# -*- coding: utf-8 -*-

# require_relative 'main_helpers'
require 'date'

$nums = [
	# '01', # сложение и умножение вероятностей
	# '02', # задача о встрече
	# '03', # полная вероятность и формула Байеса
	# '04', # формула Бернулли
	# '05', # формулы Пуассона и Муавра-Лапласа
	'06', # дискретная св
	'07', # непрерывная св
	'08', # нормальная св
	'09', # закон больших чисел
]


$options = {
	num: 2, #$nums.join('_').gsub('0', ''),
	questions: $nums.length,
}

############################################


$tmpl = open(
	"./templates/kr/#{$options[:questions]}", encoding: 'utf-8'
	) { |file| file.read }

def generate_tasks
  tasks = Hash.new
  $nums.each do |t|
    tasks[t] = open(
    	"./stories/prob/generated/#{t}.txt", encoding: 'utf-8'
    	) { |f| f.readlines.reverse }
  end
  tasks
end

$tasks = generate_tasks

def prepare(n, f)
	tasks = generate_tasks
	n.times do
	  list = $nums.map { |t| tasks[t].pop }
	  f.write($tmpl % list)
	end
end

open(
	"./data/kr_prob_#{$options[:num]}.tex", 
	'w', 
	encoding: 'utf-8'
	) { |file| prepare 60, file	}

tex = open("./kr_prob.tex", 'w', encoding: 'utf-8') do |file|
	tmpl = open("./kr_tex_tmpl") { |tmpl| tmpl.read }
	file.write(tmpl % {
		proc: '%',
		kr: "data/kr_prob_#{$options[:num]}",
		dzn: $options[:num],
	})
end

puts "done, kr_#{$options[:num]} is written"
# -*- coding: utf-8 -*-

$tmpl = "%{a} и %{b} условились встретиться в определенном месте между %{strt} и %{eend}. Каждый из них может прийти в любое время в течение указанного промежутка и ждет второго некоторое время. %{a} ждет %{t1} минут, после чего уходит; %{b} ждет %{t2} минут, после чего уходит. В %{eend} любой из них уходит, сколько бы до этого он ни ждал. Чему равна вероятность того, что %{event}?%{newline}"

$names = [
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['Петя', 'Вася', 'Аня', 'Катя', 'Андрей', 'Полина', 'Надя', 'Алексей', 'Света', 'Саша'],
	['д\'Артаньян', 'Портос', 'Атос', 'Арамис'],
	['Леонардо', 'Микеланджело', 'Донателло', 'Рафаэль'],
	['Архип', 'Леонтий', 'Дуня', 'Глаша', 'Пафнутий', 'Пелагия'],
	['Бэтмен', 'Робин'],
	['Джордж Оруэлл', 'Эрнест Хэмингуэй', 'Марк Твен', 'Габриэль Гарсия Маркес', 'Джон Фаулз'],
	['Мик Джаггер', 'Кит Ричардс', 'Дэйв Гилмор', 'Ян Пэйс', 'Джим Моррисон'],
	['Владимир Путин', 'Барак Обама'],
	['Иван Гермогенович Енотов', 'Карик', 'Валя'],
	['Хоттабыч', 'Волька Костыльков', 'Женя Богорад', 'Степан Степаныч Пивораки'],
	# ['', '']
]

$events = [
	'%{a} и %{b} встретятся',
	'%{a} и %{b} не встретятся',
	'%{a} придет раньше, чем %{b}',
	'%{a} опоздает менее чем на полчаса',
	'%{a} опоздает более чем на полчаса',
	'встреча состоится в первые полчаса',
	'встреча состоится в первые двадцать минут',
	'встреча произойдет не ранее чем без четверти %{eend}',
	'встреча состоится в последние полчаса',
	# '',
	# '',
	]

def choose_names(names)
	out = Array.new
	domain = names.shuffle.pop.shuffle
	2.times do
		out.push domain.pop
	end
	out
end

def choose_bounds
	a = Random.rand(19) + 1
	b = a + Random.rand(3) + 1
	strt = "%02d:00" % a
	eend = "%02d:00" % b
	[strt, eend, b-a]
end

def choose_times(bounds)
	m = bounds[2]
	t1 = 10 * (Random.rand(3) + 1 + m)
	t2 = t1
	while t2 == t1
		t2 = 10 * (Random.rand(3) + 1 + m)
	end
	[t1, t2]
end

def generate(n)	
	file = open("#{Dir.pwd}/02.tex", 'w')

	n.times do |i|
		names = choose_names $names
		bounds = choose_bounds 
		times = choose_times bounds
		event = $events.shuffle.pop % { 
			a: names[0], b: names[1], eend: bounds[1] 
		}
		newline = i < n-1 ? "\n" : ''

		file.write $tmpl % {
			a: names[0], 
			b: names[1],
			t1: times[0], 
			t2: times[1],
			strt: bounds[0], 
			eend: bounds[1],
			event: event, 
			newline: newline
		}
	end

	file.close
	puts 'done'
end

generate 50
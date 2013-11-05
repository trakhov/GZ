# -*- coding: utf-8 -*-

require './writer'

$colors = [
	{single: 'красный',	r: 'красных',	i: 'красные'},
	{single: 'белый',	r: 'белых',		i: 'белые'},
	{single: 'черный',	r: 'черных',	i: 'черные'},
	{single: 'синий',	r: 'синих',		i: 'синие'},
	{single: 'зеленый',	r: 'зеленых',	i: 'зеленые'},
	{single: 'желтый',	r: 'желтых',	i: 'желтые'},
	{single: 'голубой',	r: 'голубых',	i: 'голубые'}
]

def colors
	list = $colors.shuffle
	[list.pop, list.pop]
end

def generate
	tmpl = open("#{Dir.pwd}/help_03_tmpl") do |file| 
		file.readlines.shuffle!.pop
	end

	color1, color2 = colors
	color = Random.rand < 0.5 ? color1 : color2
	clarked, marlean = ['чистые', 'гашеные'].shuffle

	task = tmpl % {
		a: Random.rand(10)+5,
		b: Random.rand(10)+5,
		c: Random.rand(10)+5,
		d: Random.rand(10)+5,
		m: Random.rand(2)+2,
		n: Random.rand(3)+2,
		clarked: clarked,
		marlean: marlean,
		color1: color1[:single],
		color2: color2[:single],
		colors1r: color1[:r],
		colors2r: color2[:r],
		colors1i: color1[:i],
		colors2i: color2[:i],
		color: color[:single],
		colorsi: color[:i]
	}
	task
end

write 50, '03.txt'
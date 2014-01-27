# -*- coding: utf-8 -*-
# формула полной вероятности и формула Байеса

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }


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

def options
	color1, color2 = colors		
	color = Proc.new { |color1, color2| rand < 0.5 ? color1 : color2 }
	clarked, marlean = ['чистые', 'гашеные'].shuffle

	{
		a: rand(5..12),
		b: rand(5..12),
		c: rand(5..12),
		d: rand(5..12),
		m: rand(2..3),
		n: rand(2..5),
		clarked: clarked,
		marlean: marlean,
		color1: color1[:single],
		color2: color2[:single],
		colors1r: color1[:r],
		colors2r: color2[:r],
		colors1i: color1[:i],
		colors2i: color2[:i],
		color: color[color1, color2][:single],
		colorsi: color[color1, color2][:i]
	}
end

write 60, __FILE__
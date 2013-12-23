# -*- coding: utf-8 -*-

[
	'../helpers',
	'./stat_helpers',	
	# './prob_helpers',
	'./distributions'
].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]



def options
	m = rand(5..40) * 10
	expo = T_Expo.new(m)
	bino = T_Bino.new(m)
	pois = T_Bino.new(m)
	geom = T_Geom.new(m)
	star = T_Star.new(m)
	# unif = T_Unif.new(m)
	
	{
		expo_n: expo.wash[:sum],
		bino_n: bino.wash[:sum],
		pois_n: pois.wash[:sum],
		geom_n: geom.wash[:sum],
		star_n: star.wash[:sum],
		expo: expo.tex,
		bino: bino.tex, 
		pois: pois.tex,
		geom: geom.tex, 
		star: star.tex
	}
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100

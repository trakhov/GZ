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
	norm = T_Norm.new(m)
	unif = T_Unif.new(m)

	out = {}

	['expo', 'bino', 'pois', 'geom', 'norm', 'unif'].each do |dist|
		out["#{dist}".to_sym] = eval "#{dist}.tex"
		out["#{dist}_n".to_sym] = eval "#{dist}.wash[:sum]"
		out["#{dist}_nu_1".to_sym] = eval "#{dist}.nu_1.round"
		out["#{dist}_nu_2".to_sym] = eval "#{dist}.nu_2.round"
		out["#{dist}_mu_2".to_sym] = eval "#{dist}.mu_2.round"
	end
	
	# {
	# 	expo_n: expo.wash[:sum],
	# 	bino_n: bino.wash[:sum],
	# 	pois_n: pois.wash[:sum],
	# 	geom_n: geom.wash[:sum],
	# 	norm_n: norm.wash[:sum],
	# 	expo: expo.tex,
	# 	bino: bino.tex, 
	# 	pois: pois.tex,
	# 	geom: geom.tex, 
	# 	norm: norm.tex,		
	# 	unif_nu_1: unif.nu_1.round,
	# 	unif_nu_2: unif.nu_2.round,
	# 	unif_mu_2: unif.mu_2.round,
	# 	pois_nu_1: pois.nu_1.round,
	# 	pois_nu_2: pois.nu_2.round,
	# 	pois_mu_2: pois.mu_2.round
	# }
	out
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 100

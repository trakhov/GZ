# -*- coding: utf-8 -*-
# НСВ, плотность и характеристики

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options
	
	{
		task: "Найдите математическое ожидание, дисперсию и вероятность $P(X>a/2)$ непрерывной случайной величины с плотностью вероятностей $f(x)$, заданной графически\\footnote{график может быть составлен лишь из участков прямых и парабол.}.\\\\",		
		newline: '',
		# proc: '%',
	}
end

write 100
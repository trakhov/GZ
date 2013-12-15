# -*- coding: utf-8 -*-

['../helpers', './prob_helpers'].each { |helper| require_relative helper }

$glob_name = /_(\d+)\./.match(__FILE__)[1]

def options
	
	{
		task: "Найдите математическое ожидание, дисперсию и вероятность $P(X>a/2)$ непрерывной случайной величины с плотностью вероятностей $f(x)$, заданной графически\\footnote{график может быть составлен лишь из участков прямых и парабол.}.\\\\",		
		newline: '',
		# proc: '%',
	}
end

write 100
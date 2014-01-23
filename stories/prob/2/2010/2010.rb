# -*- coding: utf-8 -*-
# ДСВ, ряд распределения и числовые характеристики

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }


def options
	nN = from_range (10..15)
	mM = from_range (5..rand(5..(nN-5)))
	nn = from_range (3..4)

	{
		mM_ccc: mM,
		nN_ccc: nN,
		nn_ccc: nn,
		lL_ccc: nN - mM,
		n_bern: from_range((4..6)),
		p_bern: prob.values.shuffle.pop,
		n_geom: from_range((3..6)),
		proc: '\%',
		task: 'Найдите для этой случайной величины: \par \smallskip\small{ \par \zz ряд распределения (и постройте полигон); \par \zz функцию распределения (и постройте ее график); \par \zz математическое ожидание; \par \zz дисперсию и среднее квадратическое отклонение.\par \par}',
	}
end

# puts options

write 60, __FILE__
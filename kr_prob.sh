#!/bin/bash

nums=(
	# 01 # сложение и умножение вероятностей
	# 02 # задача о встрече
	# 03 # полная вероятность и формула Байеса
	# 04 # формула Бернулли
	# 05 # формулы Пуассона и Муавра-Лапласа
	06 # дискретная св
	07 # непрерывная св
	08 # нормальная св
	09 # закон больших чисел
	# 201, # ф-ция расп дсв -> ряд распределения
	# 202, # ф-ция расп нсв -> плотность, вероятность, графики
	# 203, # норм расп -> вероятность, квантиль, проц. т.
	# 204, # показ расп -> параметр, вероятность, матожидание
	# 205, # нсв -> мода, медиана, матожидание
	# 206, # нсв, дсв -> начальные и центральные моменты,
	# 207, # равномерная св
	# 208, # показательная св, функция надежности
	# 209, # биномиальная св
	# 210, # геометрическая св
	# 211, # неравенство Маркова
	# 212, # неравенство Чебышёва
)

typ=kr
name=2
# name=${nums[*]}

cd stories/prob
for num in ${nums[*]}; do
	ruby gen_$num.rb;
done

cd ../..
ruby "$typ"_prob.rb

latex -output-directory output -output-format pdf "$typ"_prob.tex

cd output
rm *.out *.aux *.log
mv "$typ"_prob.pdf "$typ"_prob_${name// /_}.pdf

if [ ! $(pidof evince) ] 
	then
	evince "$typ"_prob_${name// /_}.pdf
fi

exit 0
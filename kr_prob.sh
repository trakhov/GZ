#!/bin/bash

# '01', # сложение и умножение вероятностей
# '02', # задача о встрече
# '03', # полная вероятность и формула Байеса
# '04', # формула Бернулли
# '05', # формулы Пуассона и Муавра-Лапласа
# '06', # дискретная св
# '07', # непрерывная св
# '08', # нормальная св
# '09', # закон больших чисел

typ=kr
nums=(06 07 08 09)
name=2 #${nums[*]}

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

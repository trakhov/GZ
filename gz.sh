#!/bin/bash

CHAPTER=alge			# alge, calc, prob, game
TYP=exam				# kr, letuch, exam
NO=2
TMPL='grade45(6)'
SORT=''

NUMS=(
# # alge
	# 1 линейная алгебра
		# 111 # линейные операции над матрицами
		# 112 # умножение матриц
		# 121 # определители простые 3x3
		# 120 # 111 + 112 + 121
		# 123 # обратная матрица
		# 131 # система уравнений 3x3
		132 # система уравнений 4x4
	# 2 аналитическая геометрия
		# 211 # 
		# 221 # простейшее уравнение прямой 
		# 222 # точка пересечения прямых
		223 # произвольная задача на уравнения прямых
		# 225 # площадь треугольника
		# 231 # уравнение плоскости
		235 # пирамида: объемы и площади
		122 # определители 4x4
		224 # система неравенств
		237 # произвольная задача в пространстве
	# 3 пространства и операторы
		# 302 # 
		# 330 #
# # calc
	# 101
	# 
	# 
# # prob 
	# 1 случайные события
		# 101 # классическая вероятность (простейшее)
		# 102 # сложение/умножение вероятностей
		# 103 # геометрическая вероятность
		# 104 # формула Бернулли (простейшее)
		# 105 # полная вероятность
		# 106 # приближенные формулы
		# 107 # 
		# 108 # 
		# # -------------------
		# 1020 # сложение и умножение вероятностей
		# 1030 # задача о встрече
		# 1040 # формула Бернулли
		# 1050 # полная вероятность и формула Байеса
		# 1060 # формулы Пуассона и Муавра-Лапласа
	# 2 случайные величины
		# 200 # ряд расп дсв -> числовые характеристики
		# 201 # ф-ция расп дсв -> ряд распределения
		# 202 # ф-ция расп нсв -> плотность, вероятность, графики
		# 203 # норм расп -> вероятность, квантиль, проц. т.
		# 204 # показ расп -> параметр, вероятность, матожидание
		# 205 # нсв -> мода, медиана, матожидание
		# 206 # нсв, дсв -> начальные и центральные моменты
		# 207 # равномерная св
		# 208 # показательная св, функция надежности
		# 209 # биномиальная св
		# 210 # геометрическая св
		# 211 # неравенство Маркова
		# 212 # неравенство Чебышёва
		# 213 # 
		# 214 # 
		# 215 # 
		# # -------------------	
		# 2010 # дискретная св
		# 2020 # непрерывная св
		# 2021 # ф-ция расп или плотность нсв
		# 2030 # нормальная св	
		# 2031 # разные законы распределения
		# 2120 # закон больших чисел
	# 3 мат. статистика
		# 301 # распределение выборки -> полигон, функция расп.
		# 302 # оценки генеральных средней и дисперсии
		# # -------------------
		# 3020 # характеристики и графики распределения выборки
		# 3030 # метод моментов
		# 3040 # метод наибольшего правдоподобия
# # game
	# 101
	# #############################
)


if [[ $TMPL == '' ]]
	then
	TMPL=${#NUMS[*]}
fi

if [[ $NO == '' ]]
	then
	NO="''"
fi

PNUMS=${NUMS[*]}

cd stories/$CHAPTER
for NUM in ${NUMS[*]}; do
	cd $(echo $NUM | grep -o ^[0-9a-z])/$NUM/
	ruby "$NUM.rb";
	cd ../..
done

cd ../..
sed -i "
	s/^#*\s*\$nums .*/\$nums = [\'${PNUMS// /\', \'}\']$SORT/;
	s/^#*\s*\$no .*/\$no = $NO/;
	s/^#*\s*\$typ .*/\$typ = \'$TYP\'/;
	s/^#*\s*\$chapter .*/\$chapter = \'$CHAPTER\'/;
	s/^#*\s*\$template .*/\$template = \'$TMPL\'/;
	" gz.rb

ruby gz.rb

if [[ $NO != "''" ]]
	then
	FULLNAME=$TYP'_'$CHAPTER'_'${NO// /_}
else
	FULLNAME=$TYP'_'$CHAPTER
fi

latex -output-directory output -output-format pdf $TYP'_'$CHAPTER.tex

cd output
mv $TYP'_'$CHAPTER.pdf $FULLNAME.pdf
rm *.out *.aux *.log

if [[ ! $(pidof evince) ]] 
	then
	evince $FULLNAME.pdf
fi

exit 0
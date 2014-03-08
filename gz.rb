# -*- coding: utf-8 -*-

wdir = /(.*GZ)/.match(File.expand_path $0)[1]
Dir.glob("#{wdir}/helpers/*.rb") { |h| require h }

game_letuch_1 = {
	name: 'game_letuch_1',
	main: 'letuch/main',
	tml: 'letuch/(12)',
	qnty: 6,
	tasks: %w( 
		game/domsaddle 
		game/mixed_2x2 
	)
}

game_sem_1 = {
	name: 'game_sem_1',
	main: 'kr/main',
	tml: 'plain',
	qnty: 1,
	tasks: ['game/geom']
}


game_dz_1 = {
	name: 'game_dz_1',
	tml: 'dz',
	tasks: %w( game/night )
}


game_letuch_2 = {
	name: 'game_letuch_2',
	main: 'letuch/main',
	tml: 'letuch/1',
	qnty: 6,
	tasks: [
		'game/bi_2x2_md',		# Внимание: нужно выбрать условие (летучка/контрольная)
	]
}




prepare game_letuch_2, count_by: 'student', from: 'ob_12', generate: true





##################3


alge_exam_3 = { # экзамен (заочное), оценка 3
	name: 'zao_alge_exam_3', 
	main: 'exam/main', tml: 'exam/grade3(6)', 
	qnty: 30,
	tasks: [
		'alge/1/matr_all',
		'alge/1/matr_inv',
		'alge/1/sleq_3',
		'alge/2/line_eq',
		'alge/2/tri_area',
		'alge/2/plane_eq'
	]
}

alge_exam_45 = { # экзамен (заочное), оценка 45
	name: 'zao_alge_exam_45', 
	main: 'exam/main', tml: 'exam/grade45(6)', 
	qnty: 5,
	tasks: [
		'alge/1/matr_det4',
		'alge/2/line_2d',
		'alge/2/pyramid',
		'alge/1/sleq_4',
		'alge/2/inequal',
		'alge/2/line_3d'
	]
}	

prob_min = { # минимум для очного 
	name: 'prob_min', 
	main: 'exam/main', tml: 'exam/10', 
	qnty: 20,
	tasks: [
		'prob/1/classic1', # классическая вероятность (простейшее)
		'prob/1/and_or_1', # сложение/умножение вероятностей
		'prob/1/meet', # задача о встрече
		'prob/1/bern_1', # формула Бернулли (простейшее)
		'prob/1/bayes_1', # полная вероятность
		'prob/1/approx_1', # приближенные формулы (простой вариант)
		'prob/2/200', # ряд расп дсв -> числовые характеристики
		'prob/2/2021', # ф-ция расп или плотность нсв
		'prob/2/2031', # joind 203, 207, 208, 209, 210
		'prob/3/302', # оценки генеральных средней и дисперсии		
	]
}

zao_game_kr = { # контрольная для заочного 
	name: 'zao_game_kr_e12_antonova', 
	tml: 'zao/7',
	tasks: %w(
		game/zao/saddle
		game/zao/geom
		game/zao/simplex
		game/zao/uncertain
		game/zao/cartel
		game/zao/bimatrix
		game/zao/coop
	)
}





# prepare prob_min

# prepare alge_exam_3
# prepare alge_exam_45

# prepare zao_game_kr, count_by: 'student', from: 'e_12', generate: false
# prepare zao_game_kr, count_by: 'student', from: 'es_12'









	[ # другие задачи
		# 'matr_lop', # линейные операции над матрицами
		# 'matr_mul', # умножение матриц
		# 'matr_det', # определители простые 3x3
		# '222', 			# точка пересечения прямых
	]

	[ # другие задачи
		# # -------------------
		# 'geom_prob', # геометрическая вероятность
		# '107', # 
		# '108', # 
		# 'and_or_2', # сложение и умножение вероятностей
		# 'bern_2', # формула Бернулли
		# 'bayes_2', # полная вероятность и формула Байеса
		# 'approx_2', # формулы Пуассона и Муавра-Лапласа
		# '201', # ф-ция расп дсв -> ряд распределения
		# '202', # ф-ция расп нсв -> плотность, вероятность, графики
		# '203', # норм расп -> вероятность, квантиль, проц. т.
		# '204', # показ расп -> параметр, вероятность, матожидание
		# '205', # нсв -> мода, медиана, матожидание
		# '206', # нсв, дсв -> начальные и центральные моменты
		# '207', # равномерная св
		# '208', # показательная св, функция надежности
		# '209', # биномиальная св
		# '210', # геометрическая св
		# '211', # неравенство Маркова
		# '212', # неравенство Чебышёва
		# '213', # 
		# '214', # 
		# '215', # 
		# # -------------------	
		# '2010', # дискретная св
		# '2020', # непрерывная св
		# '2030', # нормальная св	
		# '2120', # закон больших чисел
		# '301', # распределение выборки -> полигон, функция расп.
		# # -------------------
		# '3020', # характеристики и графики распределения выборки
		# '3030', # метод моментов
		# '3040', # метод наибольшего правдоподобия # другие задачи
	]
	
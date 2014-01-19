# -*- coding: utf-8 -*-

require_relative 'helpers'


$courses = {
	'100103.65' => [		
		['Концепции современного естествознания', 'ЕМиТД', 'В. Г. Соловьев'],
		['Региональная экономика РФ', 'экономики', 'М. В. Васильева'],
		['ИТ в сервисе', 'МиЕНД'],
		['Анимация туризма', 'сервиса', 'А. В. Аврамов'],
		['Инновации в СКСиТ', 'сервиса', 'Е. В. Аврамова'],
		['Информатика', 'ЕМиТД', 'И. Д. Трахов'],
		['Культурология', 'ГиСКД', 'А. В. Аврамов'],
		['Маркетинг в СКСиТ', 'МиЭ', 'М. В. Васильева'],
		['Математика', 'ЕМиТД', 'О. В. Нестерук'],
		['Менеджмент в СКСиТ', 'МиЭ', 'Е. С. Иванов'],
		['Методы научных исследований', 'сервиса', 'А. В. Аврамов'],
		['Мировая культура и искусство', 'сервиса', 'А. В. Аврамов'],
		['Музейная и выставочная работа', 'сервиса', 'А. В. Аврамов'],
		['Основы социально-культурной деятельности', 'сервиса', 'Е. В. Павлова'],
		['Отечественная история', 'ГиСКД', 'А. А. Крутских'],
		['Правоведение', 'МиЭ', 'В. В. Федоткин'],
		['Правовое обеспечение СКСиТ', 'сервиса', 'В. Е. Егоров'],
		['Профессиональная этика и этикет', 'ГиСД', 'А. В. Аврамов'],
		['Психологический практикум', 'ГиСД', 'Н. Н. Соловьев'],
		['Психология и педагогика', 'ГиСД', 'Т. А. Соловьева'],
		['Реклама в СКСиТ', 'сервиса', 'Е. В. Павлова'],
		['Речевая коммуникация', 'сервиса', 'Е. В. Павлова'],
		['Связи с общественностью', 'ГиСД', 'А. В. Аврамов'],
		['Сервисная деятельность', 'сервиса', 'Е. В. Павлова'],
		['Стандартизация и сертификация', 'МиЭ', 'В. Е. Егоров'], # соц-культ и тур. услуг
		['Техника и технология в СКСиТ', 'сервиса', 'Г. В. Лепеш'],
		['Философия', 'ГиСД', 'А. В. Аврамов'],
		['Экономика', 'ЭиМ', 'Ю. А. Гильярди'],
	],
	'100100.62' => [
		['ИТ в сервисе (оргтехника)', 'МиЕНД', 'Н. А. Колесникова'],
		['ОФСС (1 семестр)', 'сервиса', 'Н. А. Рыбакова'],
		['ОФСС (2 семестр)', 'сервиса', 'Н. А. Рыбакова'],
		['Организация ТО и ремонта ТС', 'сервиса', 'А. Е. Муравьев'],
		['Региональная экономика РФ', 'экономики', 'М. В. Васильева'],
		['Автотранспортные средства', 'сервиса', 'В. А. Басов'],
		['Дооборудование и тюнинг ТС', 'сервиса', 'Б. Д. Ефремов'],
		['Информатика', 'ЕМиТД', 'И. Д. Трахов'],
		['Культурология', 'ГиСКД', 'А. В. Аврамов'],
		['Математика (1 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Математика (2 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Математика (3 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Материаловедение', 'МиЕНД', 'И. П. Никифоров'],
		['Метрология, стандартизация и сертификация', 'сервиса', 'А. В. Благовещенский'],
		['Отечественная история', 'ГиСКД', 'А. А. Крутских'],
		['Правоведение', 'МиЭ', 'В. В. Федоткин'],
		['Предпринимательская деятельность', 'МиЭ', 'Т. В. Федорова'],
		['Прогнозирование и планирование в сервисе', 'МиЭ', 'Л. В. Ильина'],
		['Проектирование процесса оказания услуг', 'сервиса', 'А. Е. Муравьев'],
		['Профессиональная этика и этикет', 'ГиСД', 'А. В. Аврамов'],
		['Психологический практикум', 'ГиСД', 'Н. Н. Соловьев'],
		['Психология и педагогика', 'ГиСД', 'Т. А. Соловьева'],
		['Сервисная деятельность', 'сервиса', 'Е. В. Павлова'],
		['Системный анализ в сервисе', 'МиЕНД', 'О. В. Нестерук'],
		['Технические средства предприятий сервиса', 'сервиса', 'В. А. Басов'],
		['Технологические процессы в сервисе (1 семестр)', 'сервиса', 'В. А. Басов'],
		['Технологические процессы в сервисе (2 семестр)', 'сервиса', 'В. А. Басов'],
		['Философия', 'ГиСКД', 'А. В. Аврамов'],
		['Химия', 'МиЕНД', 'С. В. Иванов'],
		['Экономика', 'ЭиМ', 'Ю. А. Гильярди'],
	],
	'100101.65' => [
		['ИТ в сервисе (оргтехника)', 'МиЕНД', 'Н. А. Колесникова'],
		['ОФСС (1 семестр)', 'сервиса', 'Н. А. Рыбакова'],
		['ОФСС (2 семестр)', 'сервиса', 'Н. А. Рыбакова'],
		['Организация ТО и ремонта ТС', 'сервиса', 'А. Е. Муравьев'],
		['Региональная экономика РФ', 'экономики', 'М. В. Васильева'],
		['Автотранспортные средства', 'сервиса', 'В. А. Басов'],
		['Дооборудование и тюнинг ТС', 'сервиса', 'Б. Д. Ефремов'],
		['Информатика', 'ЕМиТД', 'И. Д. Трахов'],
		['Культурология', 'ГиСКД', 'А. В. Аврамов'],
		['Математика (1 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Математика (2 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Математика (3 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Математика (4 семестр)', 'ЕМиТД', 'О. В. Нестерук'],
		['Материаловедение', 'МиЕНД', 'И. П. Никифоров'],
		['Метрология, стандартизация и сертификация', 'сервиса', 'А. В. Благовещенский'],
		['Отечественная история', 'ГиСКД', 'А. А. Крутских'],
		['Правоведение', 'МиЭ', 'В. В. Федоткин'],
		['Предпринимательская деятельность', 'МиЭ', 'Т. В. Федорова'],
		['Прогнозирование и планирование в сервисе', 'МиЭ', 'Л. В. Ильина'],
		['Проектирование процесса оказания услуг', 'сервиса', 'А. Е. Муравьев'],
		['Профессиональная этика и этикет', 'ГиСД', 'А. В. Аврамов'],
		['Психологический практикум', 'ГиСД', 'Н. Н. Соловьев'],
		['Психология и педагогика', 'ГиСД', 'Т. А. Соловьева'],
		['Сервисная деятельность', 'сервиса', 'Е. В. Павлова'],
		['Системный анализ в сервисе', 'МиЕНД', 'О. В. Нестерук'],
		['Технические средства предприятий сервиса', 'сервиса', 'В. А. Басов'],
		['Технологические процессы в сервисе (1 семестр)', 'сервиса', 'В. А. Басов'],
		['Технологические процессы в сервисе (2 семестр)', 'сервиса', 'В. А. Басов'],
		['Философия', 'ГиСКД', 'А. В. Аврамов'],
		['Химия', 'МиЕНД', 'С. В. Иванов'],
		['Экономика', 'ЭиМ', 'Ю. А. Гильярди'],
	],
}


############################################


$tmpl_data = open("./tmpl_data") { |file| file.read }
$tmpl_tex = open("./tmpl_tex") { |file| file.read }

$courses.keys.each do |spec|
	$courses[spec].each do |course|
		data = open("./data/#{course[0]}", 'w')	
		lines = open("./txt/#{spec}/#{course[0]}.txt") { |f| f.readlines }
		tasks = (0..lines.length/2-1).map { |i| [lines[i], lines[-i-1]] }
		tasks.each do |task|
			data.write($tmpl_data % task)
		end
		data.close

		data = open("./data/#{course[0]}") { |f| f.read }
		out = open("./tex/#{spec}/#{spec} #{course[0]}.tex", 'w')
		out.write($tmpl_tex % {
			disc: splt(course[0]),
			spec: spec,
			kafedra: course[1],
			data: data
			})
		out.close
	end
end

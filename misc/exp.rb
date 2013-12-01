# -*- coding: utf-8 -*-

def coin(txt)
	re = /\%\%([^\%]+)\%\%/
	while re.match(txt) != nil
		mch = re.match(txt)[0]
		chosen = re.match(txt)[1].split('|').shuffle!.pop
		txt.gsub! mch, chosen
	end

	txt
end

string = '%%Человек|Курица|Кошка%% высиживает %%куриное|страусиное%% яйцо'


puts coin string
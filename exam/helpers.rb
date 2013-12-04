# -*- coding: utf-8 -*-

def splt(txt)
	if /\s/.match(txt) == nil
		txt + ' \\\\'
	elsif txt.length < 15
		txt + ' \\\\'
	elsif txt.split(' ')[0].length > 15
		'\\\\ ' + '\\multicolumn{2}{r}{ ' + txt + ' }'		
	else		
		txt.sub(' ', '\\\\\\ \\multicolumn{2}{r}{ ') + ' }'
	end
end

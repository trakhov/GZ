# -*- coding: utf-8 -*-
## ночь перед экзаменом ##

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	probs = drv_probs 4
	vals = %w( I II III IV ).map { |e| "\\text{#{e}}" }

	a = Matrix.build(4,4) do |i,j| 
		j == 3 ? 90 : rand((30 + 10*(i+j))..(50 + 10*(i+j)) )
	end

	b = Matrix.build(4,1) do |i,j| 
		i == 3 ? 0 : rand((23 - 10*i)..(33 - 10*i ))
	end
	
	
	{
		grades: a.tex,
		pleasures: b.tex,
		probs: table(vals, probs, hdr_col: false, align: 'c'),
		alpha: "0{,}#{ rand 1..9 }"		
	}
end

# options.each { |o| print "#{o[0]}: #{o[1]}\n" }

write 10, __FILE__



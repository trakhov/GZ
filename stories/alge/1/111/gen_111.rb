# -*- coding: utf-8 -*-
### линейные операции над матрицами ###  

Dir.glob(/(.*GZ)/.match(File.expand_path $0)[1] + '/helpers/*') { |h| require h }

def options
	hash = {}

	ary = (2..7).map { |e| e }
	[:k1, :k2, :k3].each do |key|
		hash[key] = ary.shuffle!.pop
	end

	m = [[3,3], [2,3], [3,2]].shuffle.pop
	[:matrix1, :matrix2, :matrix3].each do |key|
		hash[key] = Matrix.build(m[0], m[1]) { rand(-5..5) }.tex
	end
	
	hash
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write_rb 50, __FILE__
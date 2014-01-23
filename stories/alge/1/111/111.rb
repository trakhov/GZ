# -*- coding: utf-8 -*-
### линейные операции над матрицами ###  

Dir.glob('helpers/*.rb').each { |helper| require File.expand_path(helper) }

def options
	hash = {}

	ary = (2..7).map { |e| e }
	[:k1, :k2, :k3].each do |key|
		hash[key] = ary.shuffle!.pop
	end

	m = [[3,3], [2,3], [3,2]].shuffle.pop
	[:matrix1, :matrix2, :matrix3].each do |key|
		hash[key] = Matrix.build(m[0], m[1]) { rand(-7..7) }.tex
	end
	
	hash
end

# options.each { |o| p "#{o[0]}: #{o[1]}\n" }

write 60, __FILE__
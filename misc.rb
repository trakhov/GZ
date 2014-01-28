$wdir = /(.*GZ)/.match(File.expand_path $0)[1]

# Dir.glob("#{$wdir}/stories/*/{1,2}/*/[0-9]*.{rb,txt,tml}") do |f| 
# 	print f + "\n"
# end


hash = {a: [1,2,3], b: ['a', 'b','c']}

p hash.map { |k, v| v.shuffle.pop }
p hash.values

p 5.times.map { |e| e + 1}

h1 = {a: 'a', b: 'b'}
h2 = {c: 1, d: 2}

p h1.merge h2
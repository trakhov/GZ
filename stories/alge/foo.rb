# -*- coding: utf-8 -*-



# p __FILE__.match(/(.*GZ)/)[1]


Dir.glob(/(.*GZ)/.match(__FILE__)[1] + 'helpers/*.rb')


m = /(.*GZ)/.match(__FILE__)[1]
mm = __FILE__.match(/.*GZ/)

p m
p mm[1]

p  File.join('boo', 'bb', 'b').class

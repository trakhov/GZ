# -*- coding: utf-8 -*-

require_relative '../helpers'

def options	
	z = sign

	a = rand(1..3)
	k = [frac(3, a**3), (-1) * frac(3, 2 * a**3)].shuffle!.pop
	
	[
		"#{tex_frac k}(x-#{a})^2, & x \\in (0; #{a}), \\\\ 0, & x \\not\\in (0; #{a}).",
		"#{tex_frac k}(x+#{a})^2, & x \\in (-#{a}; 0), \\\\ 0, & x \\not\\in (-#{a}; 0)."
	].shuffle!.pop
end

# puts options

def generate 
	tmpl = open_tmpl './tmpl_2[5]'
	tmpl % options
end

# puts generate
write 100, '2[5].txt'
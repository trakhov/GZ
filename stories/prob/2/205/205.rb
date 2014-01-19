# -*- coding: utf-8 -*-
# НСВ: мода, медиана, матож

[
	'helpers',
	'prob/prob_helpers',
	# 'prob/stat_helpers',
].each { |helper| require_relative "../../../#{helper}" }

$glob_name = /(\d+)\./.match(__FILE__)[1]

def options	
	z = sign

	a = rand(1..3)
	k = [frac(3, a**3), (-1) * frac(3, 2 * a**3)].shuffle!.pop
	
	[
		"#{tex_frac k}(x-#{a})^2, & x \\in (0; #{a}), \\\\ 0, & x \\not\\in (0; #{a}).",
		"#{tex_frac k}(x+#{a})^2, & x \\in (-#{a}; 0), \\\\ 0, & x \\not\\in (-#{a}; 0)."
	].shuffle!.pop
end


write 100
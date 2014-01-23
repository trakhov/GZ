# -*- coding: utf-8 -*-
# НСВ: мода, медиана, матож

Dir.glob(/(.*GZ)/.match(__FILE__)[1] + '/helpers/*.rb') { |h| require h }

def options	
	z = sign

	a = rand(1..3)
	k = [frac(3, a**3), (-1) * frac(3, 2 * a**3)].shuffle!.pop
	
	[
		"#{tex_frac k}(x-#{a})^2, & x \\in (0; #{a}), \\\\ 0, & x \\not\\in (0; #{a}).",
		"#{tex_frac k}(x+#{a})^2, & x \\in (-#{a}; 0), \\\\ 0, & x \\not\\in (-#{a}; 0)."
	].shuffle!.pop
end


write 60, __FILE__
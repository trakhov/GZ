$wdir = /(.*GZ)/.match(File.expand_path $0)[1]

Dir.glob("#{$wdir}/stories/*/{1,2}/*/[0-9]*.{rb,txt,tml}") do |f| 
	print f + "\n"
end

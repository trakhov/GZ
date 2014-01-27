# -*- coding: utf-8 -*-

STDOUT.sync = true

def write_rb(n, source, ticking: true)
	path = File.expand_path "..", source
	num = File.basename path

	tmpl = open("#{path}/in_#{num}.rb", encoding: 'utf-8') { |file| eval file.read }.shuffle

	while tmpl.length < n
		tmpl += tmpl
	end

	print "writing #{num} "

	tmpl.map!	do |task| 
		if ticking then print '.' end
		(coin task) % options
	end

	open("#{path}/out_#{num}.rb", 'w', encoding: 'utf-8') { |file| file.write tmpl }

	print " done!\n"
end


def clue_rb(source, *args, generate: true)
	path = File.expand_path "..", source
	num = File.basename path

	data = []
	args.each do |arg|
		dir = File.expand_path "../../#{arg}", source
		if generate then system "ruby #{dir}/gen_#{arg}.rb" end
		data += open("#{dir}/out_#{arg}.rb") { |file| eval file.read }
	end

	open("#{path}/out_#{num}.rb", 'w').write data
	print "#{args.join(', ')} clued successfully\n"
end


def coin(original)
	txt = original.dup
	re1 = /\<(\d?)\<([^<>]+)\>{2}/

	while re1.match(txt) != nil
		mch1, num = re1.match(txt)[0..-1]
		re2 = /-#{num}\<([^<>]+)\>{2}/

		ary1 = re1.match(txt)[2].split('|')
		chosen, index = ary1.map.with_index { |e, i| [e, i] }.shuffle!.pop

		txt.gsub! mch1, chosen

		while re2.match(txt) != nil
			mch2 = re2.match txt			
			txt.gsub! mch2[0], mch2[1].split('|')[index]
		end
	end

	txt
end




def write(n, source, ticking: true)
	num = File.basename source, '.rb'
	dir = File.expand_path '..', source

	Dir.chdir dir

	file = open("#{num}.txt",	'w')
	tmpl = open("#{num}.tml") { |file| file.readlines }
	lines = tmpl.length
	written = 0

	print "writing #{num} "

	while written < n
		tmpl.shuffle!
		lines.times do |i| 
			file.write((coin tmpl[i]) % options) 
			written += 1
			if ticking 
				print '.' 
			end
		end
	end

	file.close
	puts " done! "
end




def clue(source, *args, generate: true)
	num = File.basename File.source, '.rb'
	dir = File.expand_path '../..', source
	out = open(File.join(File.dirname(source), num + '.txt'), "w")

	data = []
	args.each do |num|
		if generate
			system "ruby #{File.join dir, num, num}.rb"
		end
		data += open("#{File.join dir, num, num}.txt") { |file| file.readlines }
	end

	out.write data.shuffle.join
	out.close
	print "#{args.join(', ')} clued successfully\n"
end





# 10.times { puts coin 'В поисках %%затонувшего|подскочившего|обычного%% корабля в заливе Аур капитан осведомился о количестве иных -%затонувших|подскочивших|обычных%% кораблей.'}

# puts coin '%1%a|b|c%% or %2%1|2|3%% puts r2%11|22|33%r or r1%A|B|C%r'

# puts(/(\d+).*([Bb]oo)/.match('234 dfkj boo dlsfk Boo')[2])

# puts coin 'boo %%A|B|C%% foo %1%8/9|7/8|6/7|5/6|4/5%% bobo dof odof 1/-1%9|8|7|6|5%%'

# p coin 'boo %2%1|2|3%% %1%a|b|c%% -1%AA|BB|CC%% -2%11|22|33%% -1%AAA|BBB|CCC%%'


# Сегодня мы выловили всего-навсего !!!%%4|5%%???рыбеш???ек???ки!!!

# data = open('./prob/tmpl/tmpl_06') { |file| file.readlines }

# data.each do |line|
# 	puts line
# 	puts ''
# 	puts coin line
# 	puts ''
# 	puts ''
# end

# puts coin 'выбирают %1%три|пять%% монет-1%ы| %% или брегет-1%а|ов%%'


# print coin "Вычислите определитель матрицы $ %% A | B | C | D %% $: 
# 	$$ 
# 		-% A | B | C | D %% = %{pmatrix}. 
# 	$$\n"

# print coin "Open tha brackets <1< foo | boo >> from the -1< f | b >> or from <2< A | B | C | D >> besides <3< %{sub} | %{fee} >>"
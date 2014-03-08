# -*- coding: utf-8 -*-

STDOUT.sync = true
$enc = {encoding: 'utf-8'}
$wdir = /(.*GZ)/.match(File.expand_path $0)[1]

def write(n, source, ticking: true)
	path = File.expand_path "..", source
	num = File.basename path

	tmpl = open("#{path}/in.rb", $enc) { |f| eval f.read }.shuffle

	while tmpl.length < n do
		tmpl += tmpl
	end

	print "writing #{num} "

	tmpl.map!	do |task| 
		if ticking then print '.' end
		(coin task) % options
	end

	open("#{path}/out.rb", 'w', $enc) { |f| f.write tmpl }

	print " done!\n"
end


def join(source, *args, generate: true)
	path = File.expand_path "..", source
	num = File.basename path

	data = []
	args.each do |arg|
		dir = File.expand_path "../../#{arg}", source
		if generate then system "ruby #{dir}/gen.rb" end
		data += open("#{dir}/out.rb") { |f| eval f.read }
	end

	open("#{path}/out.rb", 'w') { |f| f.write data }
	print "#{args.join(', ')} joined successfully\n"
end


def coin(original)
	txt = original.dup
	re1 = / \<(\d?)\< ([^<>]+) \>\>/x	# <2< A | B | C >>

	while re1.match(txt) != nil
		mch1, num = re1.match(txt)[0..-1]
		re2 = / -#{num}\< ([^<>]+) \>\>/x

		ary1 = re1.match(txt)[2].split('|')
		chosen, index = ary1.map.with_index { |e, i| [e, i] }.shuffle!.pop

		txt.gsub! mch1, chosen.strip

		while re2.match(txt) != nil
			mch2 = re2.match txt			
			txt.gsub! mch2[0], mch2[1].split('|')[index].strip
		end
	end

	txt
end


def prepare(event, name = event[:name], count_by: :number, from: :group, generate: true)
	stories = {}
	data = ''
	print "\npreparing to write #{name}...\n"

	event[:tasks].each do |num|
		dir = "#{$wdir}/stories/#{num}"
		if generate
			system "ruby #{dir}/gen.rb"
		end
		stories[num] = open("#{dir}/out.rb", $enc) { |f| eval f.read } 
	end

	tmpl = open("#{$wdir}/templates/#{event[:tml]}", $enc) { |f| f.read }

	counter = 
		if [:student, 'student'].include? count_by
			group from
		else
			event[:qnty].times.map { |e| e + 1 }
		end

	counter.each do |el|
		data += tmpl % ([el] + stories.values.map! { |tasks| tasks.pop })
	end

	if event[:main]
		open("#{$wdir}/output/#{name}.tex", 'w', $enc) do |tex|
			preamble = open("#{$wdir}/templates/#{event[:main]}", $enc) { |f| f.read }
			tex.write(preamble % [data])
		end
	else
		open("#{$wdir}/data/#{name}.tex", 'w', $enc) do |tex|
			tex.write data
		end
	end

	print "\ndone, #{name} is written!\n"
end


def group(name)	
	hashes = Dir.glob("#{$wdir}/groups/{och,zao}.rb").map do |file|		
		open(file, $enc) { |f| eval f.read }
	end

	groups = hashes.reduce { |a, b| a.merge b }
	groups[name.to_sym]
end


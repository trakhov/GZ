# -*- coding: utf-8 -*-

STDOUT.sync = true
$enc = {encoding: 'utf-8'}

def write(n, source, ticking: true)
	path = File.expand_path "..", source
	num = File.basename path

	tmpl = open("#{path}/in.rb", $enc) { |file| eval file.read }.shuffle

	while tmpl.length < n
		tmpl += tmpl
	end

	print "writing #{num} "

	tmpl.map!	do |task| 
		if ticking then print '.' end
		(coin task) % options
	end

	open("#{path}/out.rb", 'w', $enc) { |file| file.write tmpl }

	print " done!\n"
end


def clue(source, *args, generate: true)
	path = File.expand_path "..", source
	num = File.basename path

	data = []
	args.each do |arg|
		dir = File.expand_path "../../#{arg}", source
		if generate then system "ruby #{dir}/gen.rb" end
		data += open("#{dir}/out.rb") { |file| eval file.read }
	end

	open("#{path}/out.rb", 'w').write data
	print "#{args.join(', ')} clued successfully\n"
end


def coin(original)
	txt = original.dup
	re1 = / \<(\d?)\< ([^<>]+) \>{2}/x	# <2< A | B | C >>

	while re1.match(txt) != nil
		mch1, num = re1.match(txt)[0..-1]
		re2 = / -#{num}\< ([^<>]+) \>{2}/x

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


def generate(event, count_by: :number, from: :group)
	stories = {}
	data = ''
	print "\npreparing to write #{event[:name]}...\n"

	event[:tasks].each do |num|
		dir = "#{$wdir}/stories/#{num}"
		system "ruby #{dir}/gen.rb"
		stories[num] = open("#{dir}/out.rb", $enc) { |f| eval f.read } 
	end

	tmpl = open("#{$wdir}/templates/#{event[:tml]}", $enc) { |f| f.read }

	counter = if count_by == :number
		event[:qnty].times.map { |e| e + 1 }
	elsif count_by == :student
		group from
	end

	counter.each do |i|
		data += tmpl % ([i] + stories.map { |s, tasks| tasks.shuffle.pop })
	end

	open("#{$wdir}/output/#{event[:name]}.tex", 'w') do |tex|
		tex.write(open("#{$wdir}/templates/main") { |f| f.read } % [data])
	end

	print "\ndone, #{event[:name]} is written!\n"
end


def group(name)
	zao = open("#{$wdir}/groups/zao.rb") { |f| eval f.read }
	och = {}

	groups = zao.merge och

	groups[name]
end





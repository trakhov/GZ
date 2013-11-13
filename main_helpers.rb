# -*- coding: utf-8 -*-

def generate_tasks(nums, stories_path='prob/')
  tasks = Hash.new
  nums.each do |t|
    tasks[t] = open("./stories/#{stories_path}/#{t}.txt") do |f| 
      f.readlines.shuffle! 
    end
  end
  tasks[:num] = nums.length
  tasks
end

def prepare(n, filename, tmplname)
  datafile = open "./data/#{filename}", 'w'
  tmpl = open("./templates/#{tmplname}") { |file| file.read }
  list = nums.map { |t| tasks[t].pop }


  datafile.write($tmpl % list )
end

data = open("./data/kr_prob_1.tex", 'w')

60.times { prepare data }

data.close

puts 'done'
# -*- coding: utf-8 -*-

def generate_tasks
  tasks = Hash.new
  $nums.each do |t|
    tasks[t] = open("./stories/#{$chapter}/#{t[0]}/#{t}/#{t}.txt") do |f| 
      f.readlines.reverse 
    end
  end
  tasks
end

def prepare(n, file)
  tasks = generate_tasks
  n.times do
    list = $nums.map { |t| tasks[t].pop }
    file.write($tmpl % list)
  end
end


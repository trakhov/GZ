# -*- coding: utf-8 -*-

def generate_tasks(chapter, nums)
  tasks = Hash.new
  nums.each do |t|
    tasks[t] = open("./stories/#{chapter}/generated/#{t}.txt") do |f| 
      f.readlines.reverse 
    end
  end
  tasks
end

def prepare(n, chapter, tmpl, nums, file)
  tasks = generate_tasks chapter, nums
  n.times do
    list = nums.map { |t| tasks[t].pop }
    file.write(tmpl % list)
  end
end


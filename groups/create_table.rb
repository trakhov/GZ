
$table = <<eos
\\begin{table}[ht!]\\extrarowheight=2pt\\centering
\\begin{tabular}{>{$} c <{$} p{10cm} @{ } *{2}{>{$} r <{$}} }
	\\hline
\t\\text{№} & \\hfilФИО & m & n \\\\ \\hline
%{rows}
\\hline
\\end{tabular}
\\end{table}
eos

def create_table(group, dep: 'zao')
	students = open("#{dep}.rb") { |f| eval f.read }[group.to_sym]
	numbers = []

	ms = (1..10).map { |e| e }.shuffle
	ns = (1..6).map { |e| e }.shuffle

	ms.each do |m|
		ns.each do |n|
			numbers << [m, n]
		end
	end

	numbers.shuffle!

	rows = students.map.with_index do |student, i|
	 ["\t#{i+1}", 
	 	student + "\\dotfill", 
	 	numbers[i][0],
	 	numbers[i][1],
	 	].join(' & ') + ' \\\\'
	end.join("\n")

	open("#{group.to_s}.tex", 'w') do |file|
		file.write($table % {rows: rows})
	end
end

create_table :m_12
create_table :a_12
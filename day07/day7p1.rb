def process(file)
	input = File.read(file).split("\n")
	puts input.length.to_s + " lines"
	tree = []
	input.each do |line|
		puts line.to_s
		line.gsub!("bags","")
		line.gsub!("bag","")
		line.gsub!(".","")
		relation = line.split("contain")
		relation[0] = relation[0].strip()
		relation[1] = relation[1].split(",")
		relation[1].each do |content|
			content.gsub!(/[0-9]/,"")
			content.strip!()
		end
		puts relation.to_s
		tree.push(relation)
		puts "\n=====\n"
	end
	puts tree.to_s
end

process("sample.txt")
# process("input7.txt")
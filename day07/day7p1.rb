def search(tree, catalog, needle="shiny gold")
	puts "-=-"
	puts "Searching for '" + needle.to_s + "' in provided tree"
	puts "Catalog arrives as: " + catalog.to_s
	catalog.push(needle)
	if not tree[needle]
		puts "empty..."
		return catalog
	end
	result = tree[needle]
	result.each do |term|
		puts "Found " + term
		catalog = search(tree, catalog, term)
	end
	catalog.uniq!
	return catalog
end

def process(file, needle="shiny gold")
	input = File.read(file).split("\n")
	puts input.length.to_s + " lines"
	tree = []
	reverse = Hash[]
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
			reverse[content] = Array.new if not reverse[content]
			reverse[content].push(relation[0])
		end
		puts relation.to_s
		tree.push(relation)
		puts "----------"
	end
	puts "\n\n"
	puts reverse.to_s
	puts "\n\n"
	return reverse
end

tree = process("sample.txt")

#catalog = search(tree, catalog, "vibrant plum") #
#puts "-=-=-=-=-=-=-=-"
catalog = Array.new
catalog = search(tree, catalog, "shiny gold") # should be 4
puts "Result: " + catalog.to_s

puts "-=-=-=-=-=-=-=-"
catalog = Array.new
catalog = search(tree, catalog, "bright white") # shoud be 2
puts catalog.to_s

tree = process("input7.txt")
catalog = Array.new
catalog = search(tree, catalog, "shiny gold")
puts "Result: " + catalog.to_s
puts catalog.length - 1
# process("input7.txt")
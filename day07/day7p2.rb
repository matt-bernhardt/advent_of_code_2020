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

def explode(tree, count, needle)
	return count
end

# This takes a string of words and returns only the parts we
# care about.
def parse_line(line)
	line.gsub!("bags","")
	line.gsub!("bag","")
	line.gsub!(".","")
	return line
end

def parse_phrase(phrase)
	phrase.strip!()
	return phrase
end

# This takes the file input, and returns a hash of the parsed
# relationships.
def process(file)
	input = File.read(file).split("\n")
	reverse = Hash[]
	input.each do |line|
		puts line.to_s
		line = parse_line(line)
		relation = line.split("contain")
		relation[0] = parse_phrase(relation[0])
		relation[1] = relation[1].split(",")
		branch = Hash[]
		relation[1].each do |phrase|
			phrase.strip!()
			parts = phrase.split(" ",2)
			branch[parts[1]] = parts[0]
			reverse[relation[0]] = branch
		end
		puts branch.to_s
		puts "\n"
	end
	return reverse
end

tree = process("sample.txt")
puts tree.to_s

tree2 = process("sample2.txt")
puts tree2.to_s

c = explode(tree2, 0, "shiny gold")
puts c.to_s
#catalog = search(tree, catalog, "vibrant plum") #
#puts "-=-=-=-=-=-=-=-"
#catalog = Array.new
#catalog = search(tree, catalog, "shiny gold") # should be 4
#puts "Result: " + catalog.to_s

#puts "-=-=-=-=-=-=-=-"
#catalog = Array.new
#catalog = search(tree, catalog, "bright white") # shoud be 2
#puts catalog.to_s

#tree = process("input7.txt")
#catalog = Array.new
#catalog = search(tree, catalog, "shiny gold")
#puts "Result: " + catalog.to_s
#puts catalog.length - 1
# process("input7.txt")
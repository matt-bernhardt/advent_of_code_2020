# This recursively drills down into a hash tree, building
# a separate array that records how often each node is
# encountered.
# tree - the provided hash tree
# inventory - the array that gets populated
# count - how many copies of the current node were called for
# needle - the searched-for node in this iteration
def explode(tree, inventory, count, needle)
	puts "Iteration starts with " + count.to_s + " copies of '" + needle.to_s + "'"
	inventory.push(count)
	# inventory[needle] = count
	if not tree[needle]
		puts "  empty..."
		return inventory
	end
	result = tree[needle]
	result.each do |node|
		puts "Calls for " + node[1].to_s + " copies of '" + node[0].to_s + "'"
		inventory = explode(tree, inventory, count * node[1].to_i, node[0])
	end
	return inventory
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

puts "\n-=-=- New tree -=-=-"
tree2 = process("sample2.txt")
puts tree2.to_s

puts "\n-=-=- Starting recursion -=-="
inventory = Array.new
c = explode(tree2, inventory, 1, "shiny gold")

puts "\n-=-=- Second tree result -=-=-"
puts c.to_s
puts ( c.sum() - 1 ).to_s + " total items"



puts "\n-=-=- New tree -=-=-"
tree3 = process("input7.txt")
puts tree3.to_s

puts "\n-=-=- Starting recursion -=-="
inventory = Array.new
c = explode(tree3, inventory, 1, "shiny gold")

puts "\n-=-=- Third tree result -=-=-"
puts c.to_s
puts ( c.sum() - 1 ).to_s + " total items"

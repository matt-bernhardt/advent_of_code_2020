# This deduplicates a string
def collapse(string)
	puts "  Collapsing: " + string.to_s
	temp = string.split("")
	temp = temp.uniq()
	temp = temp.join()
	puts "  " + temp.to_s
	return temp
end

# This takes an array of strings, and returns their
# intersection (elements common to each string)
def intersection(group)
	pop = group.length
	puts "Calculating intersection among " + pop.to_s + " members"
	dict = group.join().split("").uniq().join()
	puts "Dictionary: " + dict.to_s
	blob = group.join()
	puts "Blob: " + blob.to_s
	result = []
	dict.split("").each do |char|
		result.push(char) if blob.count(char) == pop
	end
	puts "Intersection: " + result.join().to_s
	return result.join()
end

# This parses a file with multiple groups' responses
def process(file)
	puts "Processing " + file.to_s
	# Parse file into lines
	input = File.read(file).split("\n\n")
	puts input.length.to_s + " groups"

	counts = []

	input.each do |group|
		puts "\nvvv"
		group = group.split("\n")
		puts group.length.to_s + " people in the group"
		puts group.to_s
		# At this point "group" is an array of each answer
		# within the group.
		temp = intersection(group)
		counts.push(temp.length)
		puts "^^^\n"
	end

	puts counts.to_s
	puts counts.sum().to_s
	puts "=========="
end

process("sample1.txt")
process("sample2.txt")
process("input6.txt")

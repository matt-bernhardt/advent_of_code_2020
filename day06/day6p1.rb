# This deduplicates a string
def collapse(string)
	puts "  Collapsing: " + string.to_s
	temp = string.split("")
	temp = temp.uniq()
	temp = temp.join()
	puts "  " + temp.to_s
	return temp
end

def process(file)
	puts "Processing " + file.to_s
	# Parse file into lines
	input = File.read(file).split("\n\n")
	puts input.length.to_s + " entries"

	counts = []

	input.each do |line|
		line.gsub!("\n","")
		line = collapse(line)
		counts.push(line.length)
	end

	puts counts.sum().to_s
	puts "=========="
end

process("sample1.txt")
process("sample2.txt")
process("input6.txt")

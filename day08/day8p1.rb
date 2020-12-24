def process(file)
	# Init
	input = File.read(file).split("\n")
	code_size = input.length
	value = 0
	code = []
	# Populate
	current = 0
	input.each do |line|
		puts line
		op = line.split(" ")
		op.unshift(0)
		code.push(op)
	end
	puts code.to_s
	# Process
	repeat = false
	while repeat == false
		puts "----"
		puts "Line " + current.to_s + ": " + code[current].to_s
		# If we've seen this line, then stop processing
		break if code[current][0] == 1
		# Mark this line as seen
		code[current][0] = 1
		case code[current][1]
			when "acc"
				puts "Incrementing value by " + code[current][2].to_s
				value += code[current][2].to_i
				current += 1
			when "jmp"
				puts "Setting current line to " + code[current][2].to_s
				current += code[current][2].to_i
			when "nop"
				puts "No op - next line"
				current += 1
		end
		puts "Accumulator: " + value.to_s
	end
end

process("input8.txt")

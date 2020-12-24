def assess(code)
	puts "Assessing code..."
	nop = 0
	jmp = 0
	code.each do |line|
		nop += 1 if line[1] == "nop"
		jmp += 1 if line[1] == "jmp"
	end
	puts "nop: " + nop.to_s
	puts "jmp: " + jmp.to_s
	puts "Found " + ( nop + jmp ).to_s + " replacable commands"
	puts "\n"
	return nop + jmp
end

def reset(steps, verbose = false)
	puts "Resetting code execution flags" if verbose
	steps.each do |x|
		x[0] = 0
	end
	steps
end

def swap(code)
	puts "Starting to swap each replacable line..."
	puts code.to_s
	i = 0
	code.each do |line|
		puts "Testing line " + i.to_s + ": " + line.to_s
		code = reset(code)
		# Swap jmp for nop (and vice versa) if found on this line
		if line[1] == "jmp"
			line[1] = "nop"
		elsif line[1] == "nop"
			line[1] = "jmp"
		end
		puts "Result after swap: " + execute(code, true).to_s
		# Now we swap back
		if line[1] == "nop"
			line[1] = "jmp"
		elsif line[1] == "jmp"
			line[1] = "nop"
		end
		i += 1
	end
end

def execute(code, verbose = false)
	puts "Executing..." if verbose
	code = reset(code)
	current = 0
	value = 0
	# Process
	repeat = false
	while repeat == false
		puts "----" if verbose
		puts "Line " + current.to_s + ": " + code[current].to_s if verbose
		# If we've seen this line, then stop processing
		break if code[current][0] == 1
		# Mark this line as seen
		code[current][0] = 1
		case code[current][1]
			when "acc"
				puts "Incrementing value by " + code[current][2].to_s if verbose
				value += code[current][2].to_i
				current += 1
			when "jmp"
				puts "Setting current line to " + code[current][2].to_s if verbose
				current += code[current][2].to_i
			when "nop"
				puts "No op - next line" if verbose
				current += 1
		end
		puts "Accumulator: " + value.to_s if verbose
	end
	value
end

def process(file)
	puts "Loading executions"
	# Init
	input = File.read(file).split("\n")
	code_size = input.length
	code = []
	# Populate
	input.each do |line|
		puts line
		op = line.split(" ")
		op.unshift(0)
		op.push(0)
		code.push(op)
	end
	puts "\n"

	# Assess code for replacement possibilities
	options = assess(code)

	puts "\nInitial result: " + execute(code).to_s + "\n"

	swap(code)
end

process("input8.txt")

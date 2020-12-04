
# This takes the raw input (of many lines) and returns a Hash
def reshape(raw)
	output = Array.new
	raw.each do |line|
		line = line.gsub("\n"," ").split(" ")
		rebuild = Hash[]
		line.each do |field|
			swap = field.split(":")
			rebuild[swap[0]] = swap[1]
		end
		output.push(rebuild)
	end
	return output
end

# This checks the contents/format of a provided Hash against the specification
# provided by the puzzle:
# Seven required fields and formats:
# byr: four digits; at least 1920 and at most 2002
# iyr: four digits; at least 2010 and at most 2020
# eyr: four digits; at least 2020 and at most 2030
# hgt: a number followed by either cm or in:
#   If cm, the number must be at least 150 and at most 193.
#   If in, the number must be at least 59 and at most 76.
# hcl: a # followed by exactly six characters 0-9 or a-f
# ecl: exactly one of: amb blu brn gry grn hzl oth
# pid: a nine-digit number, including leading zeroes
# cid: (optional)
def validate(entry)
	puts "----------"
	puts entry
	return false if not validate_year(entry["byr"], "byr", 1920, 2002)
	return false if not validate_year(entry["iyr"], "iyr", 2010, 2020)
	return false if not validate_year(entry["eyr"], "eyr", 2020, 2030)
	return false if not validate_hgt(entry["hgt"])
	return false if not validate_color(entry["hcl"])
	return false if not validate_ecl(entry["ecl"])
	return false if not validate_pid(entry["pid"])
	puts "valid"
	return true
end

def validate_color(value)
	puts "Testing for color hcl: " + value.to_s
	if not ( value and value.match(/#[[:xdigit:]]{6}/) )
		puts "Fails hcl"
		return false
	end
	return true
end

def validate_ecl(value)
	valid = "amb blu brn gry grn hzl oth".split(" ")
	puts "Testing for ecl: " + value.to_s
	if not ( value and valid.include?(value) )
		puts "Fails ecl"
		return false
	end
	return true
end

def validate_hgt(value)
	puts "Testing for hgt: " + value.to_s
	if not ( value )
		puts "Fails hgt"
		return false
	end
	if value[-2..-1] == "cm"
		# 150 - 193
		return false if not value.chars.first(3).join.to_i.between?(150, 193)
		puts "Passes cm test: " + value.to_s
		return true
	end
	if value[-2..-1] == "in"
		# 59 - 76
		return false if not value.chars.first(2).join.to_i.between?(59, 76)
		puts "Passes in test: " + value.to_s
		return true
	end
	puts "Fails both cm and in tests: " + value.to_s
	return false
end

def validate_pid(value)
	puts "Testing for pid: " + value.to_s
	if not ( value and value.match(/\p{Nd}{9}/) )
		puts "Fails pid"
		return false
	end
	return true
end

# def validate_regex(value, valname, regex)
#	puts "Testing for regex on " + valname.to_s + ": " + value.to_s
#	if not ( value and value.match(regex) )
#		puts "Fails " + valname.to_s
#		return false
#	end
#	return true
#end

def validate_year(value, valname, min, max)
	puts "Testing for " + valname.to_s + ": " + value.to_s
	if not ( value and value.match(/\p{Nd}{4}/).to_s.to_i.between?(min, max) )
		puts "Fails " + valname.to_s
		return false
	end
	return true
end

def process(file)
	puts "Processing " + file.to_s
	input = File.read(file).split("\n\n")
	data = reshape(input)

	valid = 0
	data.each do |entry|
		valid += 1 if validate(entry)
	end
	puts "Found " + valid.to_s + " apparently valid"
	puts "=============================================="
end

process("input4.txt")
	puts "=============================================="
	puts "=============================================="
	puts "=============================================="
process("sample.txt")
process("valid.txt")
process("invalid.txt")
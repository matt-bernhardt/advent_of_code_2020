# Parse file into lines
input = File.read("input2.txt").split("\n")

good = 0

input.each do |line|
	foo = line.split
	puts foo.to_s
	range = foo[0].split("-").map(&:to_i)
	needle = foo[1].gsub(":","")
	haystack = foo[2]
	pattern = "m{2}"
	puts foo.to_s
	puts "Looking for " + range.to_s + " instances of " + needle + " in " + haystack
	puts "----"
	puts haystack.count(needle)
	if haystack.count(needle).between?(range[0],range[1])
		puts "FOUNDFOUNDFOUND"
		good += 1
	else
		puts ""
	end
	puts "========"
end

puts good.to_s + " good passwords"

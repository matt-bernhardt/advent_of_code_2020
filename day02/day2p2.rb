# Parse file into lines
input = File.read("input2.txt").split("\n")

good = 0

input.each do |line|
	foo = line.split
	puts foo.to_s
	range = foo[0].split("-").map(&:to_i)
	needle = foo[1].gsub(":","")
	haystack = foo[2]
	puts "Looking for \"" + needle + "\" at either position: " + range.to_s + " in " + haystack
	if haystack[range[0]-1] == needle
		puts "first valid"
	else
		puts ""
	end
	if haystack[range[1]-1] == needle
		puts "second valid"
	else
		puts ""
	end	
	if (haystack[range[0]-1] == needle) ^ (haystack[range[1]-1] == needle)
		puts "valid"
		good += 1
	else
		puts ""
	end
	puts "========"
end

puts good.to_s + " good passwords"

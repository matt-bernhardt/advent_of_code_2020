# Parse file into lines
input = File.read("input5.txt").split("\n")

def seat_id(code)
	rows = code[0..6].gsub("F","0").gsub("B","1").to_i(2)
	seat = code[7..9].gsub("L","0").gsub("R","1").to_i(2)
	return rows * 8 + seat
end

# Initialize seen array with 0s
seen = Hash[]
i = 0
while i <= 1024
	seen[i] = 0
	i += 1
end

max = 0
input.each do |line|
	this = seat_id(line)
	seen[this] = 1
	max = this if this > max
end

puts "Max Seat ID is:  " + max.to_s

seen.each do |index, this|
	if seen[index] == 0 && seen[index+1] == 1 && seen[index-1] == 1
		puts "Your seat ID is: " + index.to_s
	end
end

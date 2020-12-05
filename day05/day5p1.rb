# Parse file into lines
input = File.read("input5.txt").split("\n")

def seat_id(code)
	rows = code[0..6].gsub("F","0").gsub("B","1").to_i(2)
	seat = code[7..9].gsub("L","0").gsub("R","1").to_i(2)
	return rows * 8 + seat
end

def convert_rows(code)
	return code.gsub("F","0").gsub("B","1").to_i(2)
end

def convert_seats(code)
	return code.gsub("R","1").gsub("L","0").to_i(2)
end

puts convert_rows("FBFBBFF")
puts convert_seats("RLR")
puts seat_id("FBFBBFFRLR")

max = 0
input.each do |line|
	this = seat_id(line)
	max = this if this > max
end

puts "Max is " + max.to_s

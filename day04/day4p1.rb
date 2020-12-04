input = File.read("input4.txt").split("\n\n")

puts input.length

valid = 0

input.each do |data|
	data = data.gsub("\n"," ").split(" ")
	puts data
	if data.length == 8
		valid += 1
	elsif data.length == 7
		cid = false
		data.each do |field|
			cid = true if field[0..2] == 'cid'
		end
		valid += 1 if cid == false
		puts cid
	end
	puts "---"
end

puts valid
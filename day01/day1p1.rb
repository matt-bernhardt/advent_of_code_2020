puts "Hello World!"

input = File.read("input1.txt").split

for i in 0...input.size-1
	for j in i+1...input.size
		sum = input[i].to_i + input[j].to_i
		if sum == 2020
			puts "Found it!!!"
			puts input[i].to_s + " + " + input[j].to_s + " = " + sum.to_s
			product = input[i].to_i * input[j].to_i
			puts product.to_s
		end
	end
end

puts "Goodbye!"
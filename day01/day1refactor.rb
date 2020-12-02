# Problem 1 tasked us to look for groups of 2 and 3 numbers.
# I do not recommend using larger numbers than 3.
sequence_length = 3

# Map needed because the data is initially strings.
input = File.read("input1.txt").split.map(&:to_i)

# Combinatorics FTW
pairs = input.combination(sequence_length).to_a

for i in 0...pairs.size
	if pairs[i].sum == 2020
		puts pairs[i].to_s
		puts pairs[i].inject(:*)
		# With only one target expected, we could end here?
	end
end

# Problem 1 tasked us to look for groups of 2 and 3 numbers.
# I do not recommend using larger numbers than 3.

# Map needed because the data is initially strings.
input = File.read("input1.txt").split.map(&:to_i)

# Combinatorics FTW
# array: a list of numbers, provided by puzzle
# seq: the length of sequence to test for. 2 = look for pairs, 3 = look for
#      triples.
# Note: I'm using combination, not permutation, because the order does not
# matter in this case.
def ftw(array, seq=2)
	array.combination(seq).each do |s|
		return s.inject(:*) if s.sum == 2020
	end
end

puts ftw(input, 2)
puts ftw(input, 3)

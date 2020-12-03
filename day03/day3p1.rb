# Parse file into lines
input = File.read("input3.txt").split("\n")

width = input[0].length
height = input.length
x = 0 # horizontal, width
y = 0 # vertical, height

puts "width of map is " + width.to_s + " characters"
puts "height of map is " + height.to_s + " rows"

def trajectory(stepX, stepY, slope)
	trees = 0

	width = slope[0].length
	height = slope.length
	x = 0 # Horizontal, width
	y = 0 # Vertical, height

	while y < height
		# Increment if we're on a tree
		trees += 1 if slope[y][x] == '#'
		# Increment by steps
		x += stepX
		y += stepY
		# Wrap horizontally if needed
		x -= width if x >= width
	end

	return trees
end

data = []
data.push(trajectory(1, 1, input))
data.push(trajectory(3, 1, input))
data.push(trajectory(5, 1, input))
data.push(trajectory(7, 1, input))
data.push(trajectory(1, 2, input))

puts data.to_s
puts data.inject(:*)
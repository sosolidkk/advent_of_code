# part 1
depth, position, aim = 0, 0
file_reader = File.open('inputs/input_two_part_one.txt')
data = file_reader.readlines.map(&:chomp)

data.each do |item|
  type, value = item.split()

  if type == "forward"
    position += value.to_i
  elsif type == "up"
    depth -= value.to_i
  elsif type == "down"
    depth += value.to_i
  end
end

puts(depth * position)

# part 2
depth, position, aim = 0, 0, 0
file_reader = File.open('inputs/input_two_part_two.txt')
data = file_reader.readlines.map(&:chomp)

data.each do |item|
  type, value = item.split()

  if type == "forward"
    position += value.to_i
    depth += (aim * value.to_i)
  elsif type == "up"
    aim -= value.to_i
  elsif type == "down"
    aim += value.to_i
  end
end

puts(position * depth)

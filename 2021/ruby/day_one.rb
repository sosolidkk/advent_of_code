# Part 1
file_reader = File.open("inputs/input_one_part_one.txt")
data = file_reader.readlines.map(&:to_i)
data.each_cons(2).count { |(a, b)| b > a }

# Part 2
file_reader = File.open("inputs/input_one_part_two.txt")
data = file_reader.readlines.map(&:to_i)
previous_value = 0
total = []
data.each_cons(3) do |comb|
  if previous_value == 0
    previous_value = comb.sum
    next
  end

  if comb.sum > previous_value
    total << true
  end
  previous_value = comb.sum
end

puts total.size

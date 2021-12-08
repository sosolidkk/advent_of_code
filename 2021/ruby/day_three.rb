# part 1
file_reader = File.open('inputs/input_three_part_one.txt')
lines = file_reader.readlines.map(&:chomp)

len = lines.first.size
gamma_rate = ''

0.step(len - 1) do |index|
  zeros, ones = 0, 0

  lines.each do |line|
    if line[index] == '0'
      zeros += 1
    elsif line[index] == '1'
      ones += 1
    end
  end

  zeros > ones ? gamma_rate += '0' : gamma_rate += '1'
end

puts gamma_rate.to_i(2) * gamma_rate.tr('01', '10').to_i(2)

# part 2
file_reader = File.open('inputs/input_three_part_two.txt')
lines = file_reader.readlines.map(&:chomp)

accepted = lines.clone
current_index = 0
oxygen, co2 = nil, nil

loop do
  if accepted.size == 1
    oxygen = accepted.first
    break
  end

  len = accepted.first.size
  zeros, ones = 0, 0

  accepted.each do |item|
    item[current_index] == '0' ? zeros += 1 : ones += 1
  end

  if zeros > ones
    accepted, reject = accepted.partition {|e| e[current_index] == '0'}
  else
    accepted, reject = accepted.partition {|e| e[current_index] == '1'}
  end

  current_index += 1
end

accepted = lines.clone
current_index = 0

loop do
  if accepted.size == 1
    co2 = accepted.first
    break
  end

  len = accepted.first.size
  zeros, ones = 0, 0

  accepted.each do |item|
    item[current_index] == '0' ? zeros += 1 : ones += 1
  end

  if zeros <= ones
    accepted, reject = accepted.partition {|e| e[current_index] == '0'}
  else
    accepted, reject = accepted.partition {|e| e[current_index] == '1'}
  end

  current_index += 1
end

puts co2.to_i(2) * oxygen.to_i(2)

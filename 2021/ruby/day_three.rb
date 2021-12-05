file_reader = File.open('input_three_part_one.txt')
lines = file_reader.readlines.map(&:chomp)

len = lines.first.size
gamma_rate = ""

0.step(len - 1) do |index|

  zeros, ones = 0, 0

  lines.each do |line|
    if line[index] == "0"
      zeros += 1
    elsif line[index] == "1"
      ones += 1
    end
  end

  if zeros > ones
    gamma_rate += "0"
  else
    gamma_rate += "1"
  end

end

puts gamma_rate.to_i(2) * gamma_rate.tr('01', '10').to_i(2)

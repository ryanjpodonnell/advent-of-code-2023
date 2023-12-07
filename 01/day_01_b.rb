DIGITS     = {
  'one'   => 1,
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9,
  '0'     => 0,
  '1'     => 1,
  '2'     => 2,
  '3'     => 3,
  '4'     => 4,
  '5'     => 5,
  '6'     => 6,
  '7'     => 7,
  '8'     => 8,
  '9'     => 9
}

module Day01B
  def part2(filename)
    values = []
    lines = parse_input(filename)

    lines.each do |line|
      digits = line.scan(/(?=(#{DIGITS.keys.join('|')}))/).flatten
      value = (DIGITS[digits.first] * 10) + DIGITS[digits.last]

      values << value
    end

    values.inject(:+)
  end

  def parse_input(filename)
    file = File.open(filename)
    input = file.readlines.map(&:chomp)
    file.close
    input
  end
end

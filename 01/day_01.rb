class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

module Day01
  def part1(filename)
    values = []
    lines = parse_input(filename)

    lines.each do |line|
      integer_chars = line.split('')
      integer_chars.select! { |char| char.is_i? }
      value = (integer_chars.first + integer_chars.last).to_i
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

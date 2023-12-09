GameSet = Struct.new(:red_count, :green_count, :blue_count)

class Game
  attr_reader :number

  def initialize(number, sets)
    @number = number
    @sets = sets
  end

  def red_counts
    @sets.map { |set| set.red_count }.compact
  end

  def green_counts
    @sets.map { |set| set.green_count }.compact
  end

  def blue_counts
    @sets.map { |set| set.blue_count }.compact
  end

  def possible?
    (red_counts.max || 0) <= 12 && (green_counts.max || 0) <= 13 && (blue_counts.max || 0) <= 14
  end

  def wacky_number
    (red_counts.max || 0) * (green_counts.max || 0) * (blue_counts.max || 0)
  end
end


module Day02
  def part1(filename)
    games
      .select { |game| game.possible? }
      .map { |game| game.number }
      .inject(:+)
  end

  def part2(filename)
    games
      .map { |game| game.wacky_number }
      .inject(:+)
  end

  def games
    lines = parse_input(filename)
    lines.map do |line|
      game_string = line.split(': ').first
      game_number = game_string.match(/Game (\d+)/)[1].to_i

      sets_string = line.split(': ').last

      sets = sets_string.split('; ').map do |set_string|
        red_count = set_string.match(/(\d+) red/)&.values_at(1)&.first&.to_i
        green_count = set_string.match(/(\d+) green/)&.values_at(1)&.first&.to_i
        blue_count = set_string.match(/(\d+) blue/)&.values_at(1)&.first&.to_i

        GameSet.new(red_count, green_count, blue_count)
      end

      Game.new(game_number, sets)
    end
  end

  def parse_input(filename)
    file = File.open(filename)
    input = file.readlines.map(&:chomp)
    file.close
    input
  end
end

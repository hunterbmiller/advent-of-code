require 'test/unit'

def part1(wire1, wire2)
  (path(wire1) & path(wire2)).map { |pos| pos[0].abs + pos[1].abs }.min
end

def part2(wire1, wire2)
  path1 = path(wire1)
  path2 = path(wire2)
  (path1 & path2).map { |pos| (path1.find_index(pos) + 1) + (path2.find_index(pos) + 1) }.min
end

def path(wire)
  wire.inject([]) do |coordinates, move|
    coordinates + move(coordinates.last || [0, 0], parse_move(move))
  end
end

def move(coordinate, move)
  direction, distance = move
  case direction
  when 'U'
    (1..distance).map { |i| [coordinate[0], coordinate[1] + i] }
  when 'D'
    (1..distance).map { |i| [coordinate[0], coordinate[1] - i] }
  when 'R'
    (1..distance).map { |i| [coordinate[0] + i, coordinate[1]] }
  when 'L'
    (1..distance).map { |i| [coordinate[0] - i, coordinate[1]] }
  end
end

def parse_move(input)
  [input[0], input[1..-1].to_i]
end

input = File.read('input.txt').split
wire1 = input[0].split(',')
wire2 = input[1].split(',')

puts "Part 1 Solution: #{part1(wire1, wire2)}"
puts "Part 2 Solution: #{part2(wire1, wire2)}"

def calculate_fuel(mass)
  (mass / 3.0).floor - 2
end

def fuel_sum(mass)
  fuel = calculate_fuel(mass)
  return 0 unless fuel.positive?

  fuel + fuel_sum(fuel)
end

def part1(masses)
  masses.inject(0) { |sum, mass| sum + calculate_fuel(mass.to_i) }
end

def part2(masses)
  masses.inject(0) do |sum, mass|
    sum + fuel_sum(mass.to_i)
  end
end

masses = File.read('input.txt').split
puts "Part 1 Solution: #{part1(masses)}"
puts "Part 2 Solution: #{part2(masses)}"

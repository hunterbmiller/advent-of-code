def part1(program, noun, verb)
  index = 0
  program[1] = noun
  program[2] = verb
  optcode, param1, param2, output = positions(index)
  until program[optcode] == 99 || program[optcode].nil?
    program[program[output]] = instruction(program, program[optcode], program[param1], program[param2])
    index += 4
    optcode, param1, param2, output = positions(index)
  end
  program
end

def positions(index)
  [index, index + 1, index + 2, index + 3]
end

def instruction(program, optcode, param1, param2)
  if optcode == 1
    program[param1] + program[param2]
  else
    program[param1] * program[param2]
  end
end

def part2(codes, output_to_find)
  (0..99).each do |noun|
    (0..99).each do |verb|
      program = part1(codes.dup, noun, verb)
      return (100 * noun) + verb if program[0] == output_to_find
    end
  end
end

program = File.read('input.txt').split(',').map(&:to_i)
puts "Part 1 Solution: #{part1(program.dup, 12, 2)}"
puts "Part 2 Solution: #{part2(program.dup, 19690720)}"

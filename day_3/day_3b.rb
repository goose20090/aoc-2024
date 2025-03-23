require 'pry'

str = File.read('./input.txt')

relevent_strs = str.scan(/don't\(\)|do\(\)|mul\(\d+,\d+\)/)

def mult_product(str)
  pair = str.scan(/\d+/).map(&:to_i)
  pair.reduce(:*)
end

flag = true

accumulator = 0

total = relevent_strs.each do |str|
  flag = true if str == "do()"
  flag = false if str == "don't()"

  next unless str.match?(/mul\(\d+,\d+\)/) && flag

  accumulator += mult_product(str)
end

binding.pry

str = File.read('./input.txt')
mul_pairs = str.scan(/mul\(\d+,\d+\)/).map{ |pair| pair.scan(/\d+/).map!(&:to_i) }

products = mul_pairs.map{ |pair| pair.reduce(:*) } 

puts products.sum

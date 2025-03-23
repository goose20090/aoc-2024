require_relative 'list_extractor'

list_1, list_2 = ListExtractor.extract_lists_from_input

list_1.sort!

list_2.sort!

differences = list_1.map.with_index{ |num, index| ( num.to_i - list_2[index].to_i ).abs } 

total = differences.sum

puts total

require_relative 'list_extractor'

list_1, list_2 = ListExtractor.extract_lists_from_input

list_1.map!(&:to_i)
list_2.map!(&:to_i)

similarity_scores = list_1.map{ |num| num * list_2.count{ |n| n == num } }

puts similarity_scores.sum

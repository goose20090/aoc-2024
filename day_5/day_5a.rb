require 'pry'

input = File.read(File.join(__dir__, 'input.txt'))

rules, updates = input.split(/\n\n/)

rule_hash = {}

rules.split(/\n/).each do |rule| 
  before, after = rule.split("|").map(&:to_i)
  (rule_hash[before] ||= []) << after
end 

updates = updates.split(/\n/).map{ |update| update.split(",").map(&:to_i) }

def good_update? update_arr, rule_hash
  update_arr.each.with_index.all? do |num, index|
    if index == 0 || !rule_hash.key?(num)
      true
    else
      nums_before_num = update_arr[...index]
      (nums_before_num & rule_hash[num]).empty?
    end
  end
end

good_updates = updates.filter{ |update| good_update?(update, rule_hash) }

middle_elements = good_updates.map{ |update| update[update.length / 2] }

puts middle_elements.sum

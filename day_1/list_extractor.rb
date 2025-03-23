require_relative "./input.rb"

module ListExtractor
  def self.extract_lists_from_input
    list_1 = []
    list_2 = []
    INPUT.split(/\s/).each.with_index(1) do |num, index|
      next if num.empty?

      if index.odd?
        list_1 << num
      else
        list_2 << num
      end
    end
    
    [list_1, list_2]
  end
end

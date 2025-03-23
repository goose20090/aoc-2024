require_relative "./input.rb"

module ReportExtractor
  def self.extract_reports_from_input
    INPUT.split(/\n/).map{ |str| str.split(/\s/).map(&:to_i) }
  end
end

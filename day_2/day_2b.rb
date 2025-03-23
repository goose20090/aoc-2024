require_relative "./report_extractor"

reports = ReportExtractor.extract_reports_from_input



def is_safe?(report)
  return true if check_safety(report)
  report.size.times do |i|
    cloned = report.dup
    cloned.delete_at(i)
    return true if check_safety(cloned)
  end
  false
end

def check_safety report
  initial_direction = nil
  report.each.with_index do |num, index|
    return true if index == (report.size - 1)

    difference = difference_between(num, report[index + 1])

    initial_direction = difference.positive? if index == 0

    return false if difference.positive? != initial_direction
    return false if difference.abs > 3 || difference.abs < 1
  end
end

def difference_between num_1, num_2
  num_2 - num_1
end


safe_reports = reports.select{ |report| is_safe?(report) }

puts safe_reports.size

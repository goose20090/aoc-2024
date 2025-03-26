str = File.read(File.join(__dir__, 'input.txt'))

# split string into matrix

grid = str.split(/\n/).map(&:chars)

def count_xmas(grid)
  height = grid.length
  width = grid[0].length
  count = 0

  directions = [
    [0, 1],   # right
    [1, 0],   # down
    [1, 1],   # down-right
    [-1, 1],  # up-right
    [0, -1],  # left
    [-1, 0],  # up
    [-1, -1], # up-left
    [1, -1]   # down-left
  ]

  (0...height).each do |row|
    (0...width).each do |col|
      next unless grid[row][col] == "X"
      directions.each do |direction_y, direction_x|
        next unless valid_position?(row, col, direction_y, direction_x, height, width)
        if check_xmas(grid, row, col, direction_y, direction_x)
          count += 1
        end
      end
    end
  end
  count
end

def valid_position?(row, col, direction_y, direction_x, height, width)
  end_row = row + (direction_y * 3)
  end_col = col + (direction_x * 3)

  return false if end_row < 0 || end_row >= height
  return false if end_col < 0 || end_col >= width
  true
end

def check_xmas(grid, row, col, direction_y, direction_x)
  target = "XMAS"
  4.times do |i|
    current_char = grid[row + direction_y * i][col + direction_x * i]
    return false unless current_char == target[i]
  end
end

result = count_xmas(grid)
puts "XMAS appears #{result} times in the word search"

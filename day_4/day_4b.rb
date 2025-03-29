require 'pry'
str = File.read(File.join(__dir__, 'input.txt'))

grid = str.split(/\n/).map(&:chars)


def check_mas_pattern(grid, row, col, diagonal_coords)
  result = ""
  diagonal_coords.each do |co_ordinates|
    x, y = co_ordinates
    result += grid[row + x][col + y]
  end
  result == "MAS" || result == "SAM"
end

def valid_x_positions?(diagonals, row, col, height, width)
  diagonals.flatten(1).each do |co_ordinate|
    next if co_ordinate == [0, 0]

    x, y = co_ordinate
    result_x = row + x
    result_y = col + y

    return false if result_x < 0 || result_x >= height
    return false if result_y < 0 || result_y >= width
  end
  true
end

def count_x_mas(grid)
  height = grid.length
  return 0 if height == 0
  width = grid[0].length
  return 0 if width == 0

  count = 0

  top_left_to_bottom_right = [
    [-1, -1],
    [0, 0],
    [1, 1]
  ]

  top_right_to_bottom_left = [
    [-1, 1],
    [0, 0],
    [1, -1]
  ]

  diagonals = [top_left_to_bottom_right, top_right_to_bottom_left]

  (0...height).each do |row|
    (0...width).each do |col|
      next unless grid[row][col] == "A"

      diag1_coords, diag2_coords = diagonals

      next unless valid_x_positions?(diagonals, row, col, height, width)

      if check_mas_pattern(grid, row, col, diag1_coords) && \
         check_mas_pattern(grid, row, col, diag2_coords)
        count += 1
      end
    end
  end
  count
end

result = count_x_mas(grid)

puts "X-MAS appears #{result} times in the word search"


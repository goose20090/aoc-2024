require 'pry'
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


  top_left_to_bottom_right = [ 
    [-1, -1],
    [0, 0],
    [1,1],
  ]

  top_right_to_bottom_left = [
    [1,1],
    [0,0],
    [1,1]
  ]


  cross = [top_left_to_bottom_right, top_right_to_bottom_left]


(0...height).each do |row|
    (0...width).each do |col|
      next unless grid[row][col] == "A"
      direction_1, direction_2 = cross
      next unless valid_position?(cross, row, col, height, width)
      if check_xmas(grid, row, col, direction_1) && check_xmas(grid, row, col, direction_2)
          count += 1
      end
    end
  end
  count
end


def valid_position?(cross, row, col, height, width)
  cross.flatten(1).each do |co_ordinate|
    next if co_ordinate == [0,0]
    x, y = co_ordinate

    result_x = row + x
    result_y = col + y

    return false if result_x < 0 || result_x >= height
    return false if result_y < 0 || result_y >= height
  end
  true
end


def check_xmas(grid, row, col, cross_cordinates)
  result = ""
  cross_cordinates.each do |co_ordinates|
    x, y = co_ordinates

    result += grid[row + x][col + y]
  end
  binding.pry
  result == "MAS" || result == "SAM"
end

result = count_xmas(grid)

puts "XMAS appears #{result} times in the word search"

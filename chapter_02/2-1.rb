GRID_LENGTH = 8

def print_triangle(height)
  height.times do |row|
    line_length = calculate_line_length(row + 1)
    generate_line(line_length)
  end
end

def calculate_line_length(row)
  (10 - row) + (row * -1)
end

def generate_line(line_length)
  edge_count = GRID_LENGTH - line_length

  if edge_count == 0
    edge = ""
  else
    edge = " " * (edge_count/2)
  end

  octothorpes = "#" * line_length

  puts edge + octothorpes + edge
end

print_triangle(4)

# Output should be: 
########
 ######
  ####
   ##

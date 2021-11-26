=begin
    initTable -> Initialize the table with the cells
    Params
        null
    Return
        null
=end
def initTable(x_length = 8, y_length = 4)
    table = []
    for i in (0...y_length)
        row = []
        for j in (0...x_length)
            row[j] = rand(2)
        end
        table.push(row)
        print "#{table[i]}"
        print "\n"
    end
    return table
end

=begin
    getNeighbourCount -> Check neighbour count
    Params
        x -> int: Position at x axis in the matrix
        y -> int: Position at y axis in the matrix
    Return
        neighbourCount -> int: Count of near neighbours
=end
def getNeighbourCount(x, y, matrix)
    puts "x:#{x} y:#{y}"
    puts matrix[y][x]
    y1_neighbour = matrix[y-1][x]
    y2_neighbour = matrix[y+1][x]
    puts "y1:#{y1_neighbour} y2:#{y2_neighbour}"

    x1_neighbour = matrix[y][x-1]
    x2_neighbour = matrix[y][x+1]
    puts "x1:#{x1_neighbour} x2:#{x2_neighbour}"

    return (y1_neighbour + y2_neighbour + x1_neighbour + x2_neighbour)
end
myTable = initTable
puts "Total de vecinos #{getNeighbourCount(1,2, myTable)}"

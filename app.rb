$x_length = 8
$y_length = 4

def printTable(table)
    for i in (0...$y_length)
        print "#{table[i]}"
        print "\n"
    end
end
=begin
    initTable -> Initialize the table with the cells
    Params
        null
    Return
        arr[arr]
=end
def initTable()
    table = []
    for i in (0...$y_length)
        row = []
        for j in (0...$x_length)
            row[j] = rand(2)
        end
        table.push(row)
    end
    return table
end

=begin
    getNeighbourCount -> Check neighbour count
    Params
        x -> int: Position at x axis in the matrix
        y -> int: Position at y axis in the matrix
        matrix -> arr[arr]: Cell table
    Return
        neighbourCount -> int: Count of near neighbours
=end
def getNeighbourCount(y, x, matrix)
    x1_neighbour = if x == 0 then 0 else matrix[y][x-1] end
    x2_neighbour = if x == $x_length - 1 then 0 else matrix[y][x+1] end
    y1_neighbour = if y == 0 then 0 else matrix[y-1][x] end
    y2_neighbour = if y == $y_length - 1 then 0 else matrix[y+1][x] end

    return (y1_neighbour + y2_neighbour + x1_neighbour + x2_neighbour)
end

=begin
    1 -> Cell alive; 0 -> cell dead

    First gen
    [0, 1, 0]
    [1, 0, 1]   At  (1,1) 0 has 3 neighbours, so in the next gen it'll become 1
    [0, 0, 0]

    Second gen
    [0, 1, 0]
    [1, 1, 1]   At  (1,1) 1 has 3 neighbours, so in the next gen it'll become 0
    [0, 0, 0]

    Third gen
    [0, 1, 0]
    [1, 0, 1]
    [0, 0, 0]

    A cell is counter as a neighbour in the next conditions
    [X, N, X]
    [N, C, N]   At (1,1) C has valid neighbours N; X aren't considered as neighbors
    [X, N, X]
=end
def checkCells(table)
    newTable = []
    for i in (0...$y_length)
        newRow = []
        for j in (0...$x_length)
            neighbourCount = getNeighbourCount(i, j, table)
            if neighbourCount == 3
                newRow[j] = 1
            elsif neighbourCount < 2
                newRow[j] = 0
            elsif neighbourCount > 3 && table[i][j] == 1
                newRow[j] = 0
            elsif neighbourCount  == 2 || neighbourCount == 3
                newRow[j] = 1
            end
        end
        newTable.push(newRow)
    end
    return newTable
end

puts "First gen"
myTable = initTable
printTable(myTable)
puts "\n"

puts "Second gen"
myNewTable = checkCells(myTable)
printTable(myNewTable)
puts "\n"
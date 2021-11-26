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

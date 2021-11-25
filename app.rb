=begin
    Declaration of variables
    Table dimension = 8 x 4
=end
# table = [[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8]]
#table [1][3] = 1
x_length = 8
y_length = 4
table = []
#table = Array.new(4, [rand(2),rand(2),rand(2),rand(2),rand(2),rand(2),rand(2),rand(2)])

# table.each do |row|
#     puts "#{row}"
# end
# # Logic
# puts rand(2)

for i in (0...y_length)
    row = []
    if i == 0 || i == y_length - 1
        row = [0,0,0,0,0,0,0,0]
    else
        for j in (0...x_length)
            row[j] = 0
        end
    end
    table.push(row)
    print "#{table[i]}"
    print "\n"
end

input = readlines("input.txt")

counter = 0
counter2 = 0
for line in input
    ex = Meta.parse("l = $line")
    eval(ex)
    global counter += length(line) - length(l)

    global counter2 += length(line) 
        + count(c -> c in ('\\', '\"'), line) 
        + 2 - length(line)
end

# part 1
println(counter)
println(counter2)
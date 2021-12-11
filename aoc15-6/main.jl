toggle!(a,x,y) = a[x, y] += 2
turn_on!(a,x,y) = a[x, y] += 1
turn_off!(a,x,y) = a[x, y] = a[x, y] <= 1 ? 0 : a[x, y] - 1

input = readlines("input.txt")

lights = zeros((1000,1000))
for i in 1:length(input)
    m = match(r"(.*) (\d+),(\d+) through (\d+),(\d+)", input[i])
    x_range = sort([parse(Int, m.captures[2]), parse(Int, m.captures[4])])
    y_range = sort([parse(Int, m.captures[3]), parse(Int, m.captures[5])])

    if occursin("toggle", m[1])
        handle! = toggle!
    elseif occursin("on", m[1])
        handle! = turn_on!
    else
        handle! = turn_off!
    end

    for x in x_range[1]:x_range[2]
        for y in y_range[1]:y_range[2]
            handle!(lights, x, y)
        end
    end
end

println(Int(sum(lights)))

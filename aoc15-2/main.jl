using BenchmarkTools

function wraparea(t)
    a = [t[1]*t[2], t[1]*t[3], t[2]*t[3]]
    return 2 * sum(a) + min(a...)
end

function ribbonlength(t)
    l = sort(t)
    return 2*l[1] + 2*l[2] + prod(t)
end

function result(boxes)
    totalarea = sum([wraparea(b) for b in boxes])
    println(totalarea)
    println(sum([ribbonlength(b) for b in boxes]))
end

input = readlines("input.txt")
pattern = r"(\d+)x(\d+)x(\d+)"
boxes = [parse.(Int, m.captures) for m in match.(pattern, input)]
@btime result(boxes)

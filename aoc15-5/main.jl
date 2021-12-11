function isnice(str)
    if match( r"(.)\1+", str) === nothing
        return false
    end

    if match(r"(ab)|(cd)|(pq)|(xy)", str) !== nothing
        return false
    end

    m = eachmatch(r"[aeiou]", str)
    if m === nothing || length(collect(m)) < 3
        return false
    end

    return true
end

function isnicer(str)
    if match(r"(.).\1+", str) === nothing
        return false
    end

    if match(r"(..).*\1+", str) === nothing
        return false
    end

    return true
end

input = readlines("input.txt")

nice = [s for s in input if isnice(s)]
println(length(nice))

nicer = [s for s in input if isnicer(s)]
println(length(nicer))

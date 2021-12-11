input = readlines("input.txt") .|> String

for i = 1:length(input)
    input[i] = replace(input[i], "AND" => "&")
    input[i] = replace(input[i], "OR" => "|")
    input[i] = replace(input[i], "NOT" => "~")
    input[i] = replace(input[i], "LSHIFT" => "<<")
    input[i] = replace(input[i], "RSHIFT" => ">>")
    # can't use keywords
    input[i] = replace(input[i], "do" => "ddd")
    input[i] = replace(input[i], "if" => "iii")
    input[i] = replace(input[i], "in" => "iiin")

    input[i] = replace(input[i], r"(.*) -> ([a-z]+)" => s"\2 = \1")
end

function variables(str)
    m = match(r".* = ([a-z0-9]+) [|&<>]+ ([a-z0-9]+)", str)
    if m !== nothing
        return m.captures[1:2]
    else
        m = match(r".*= ~? ?([a-z0-9]+)", str)
        return m.captures[1:1]
    end
end

function declaration(str)
    for i in input
        if startswith(i, "$str ")
            return i
        end
    end

    return ""
end

noint(x) = tryparse(Int, x) === nothing

function expand_program(p, decl)
    for var in filter(x -> noint(x), variables(decl))
        d = declaration(var)
        if !(d in p)
            expand_program(p, d)
        end
    end

    push!(p, decl)
end

program = []
expand_program(program, declaration("a"))

for line in program
    ex = Meta.parse(line)
    eval(ex)
end

println(a)

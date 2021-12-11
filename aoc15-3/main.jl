input = read("input.txt") |> String

function solve(input)
    pos = [[0,0], [0,0]]

    visited = [(0, 0)]
    multi_visits = 0

    for (i,c) in enumerate(input)
        santa = i % 2 + 1
        if c == '^'
            pos[santa][2] += 1
        elseif c == 'v'
            pos[santa][2] -= 1
        elseif c == '>'
            pos[santa][1] += 1
        elseif c == '<'
            pos[santa][1] -= 1
        end
        
        if any(x->x[1] == pos[santa][1] && x[2] == pos[santa][2], visited)
            multi_visits += 1
        else
            push!(visited, (pos[santa][1], pos[santa][2]))
        end
    end
    
    length(visited)
end

println(solve(input))
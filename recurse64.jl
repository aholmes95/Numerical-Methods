function recurse64(n::Int)
    a1 = Float64(1)
    a2 = Float64(2/3)
    a3 = Float64(0);
    for i=1:n
        a3 = Float64(2*a2 - 8/9*a1)
        a1 = Float64(a2)
        a2 = Float64(a3)
    end
    a=Float64(a1)
end

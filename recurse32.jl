function recurse32(n::Int)
    a1 = Float32(1)
    a2 = Float32(2/3)
    a3 = Float32(0);
    for i=1:n
        a3 = Float32(2*a2 - 8/9*a1)
        a1 = Float32(a2)
        a2 = Float32(a3)
    end
    a=Float32(a1)
end

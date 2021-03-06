#This function evaluates the  recursion relation given by
#a_{n+1} = 2a_{n} - 8/9a_{n-1} using single precision floating point arithmetic
function recurse32(n::Int)
    a1 = Float32(1)
    a2 = Float32(2)/Float32(3)
    a3 = Float32(0);
    for i=1:n
        a3 = Float32(2)*Float32(a2) - Float32(8)/Float32(9)*Float32(a1)
        a1 = Float32(a2)
        a2 = Float32(a3)
    end
    a=Float32(a1)
end

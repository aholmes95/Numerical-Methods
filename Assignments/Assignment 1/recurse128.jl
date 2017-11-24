function recurse128(n::Int)
    a1 = BigFloat(1)
    a2 = BigFloat(2)/BigFloat(3)
    a3 = BigFloat(0);
    for i=1:n
        a3 = BigFloat(2)*BigFloat(a2) - BigFloat(8)/BigFloat(9)*BigFloat(a1)
        a1 = BigFloat(a2)
        a2 = BigFloat(a3)
    end
    a=BigFloat(a1)
end

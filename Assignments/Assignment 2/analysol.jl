function analysol(x, D, t)
    return (1.0/sqrt(2.0*D*t))*exp.(-abs(x).*sqrt((2/(D*t))))
end

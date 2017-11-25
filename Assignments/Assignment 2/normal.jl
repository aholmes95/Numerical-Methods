function normal(x, D, t)
        return (1.0/sqrt(2.0*pi*D*t))*exp(-x.*x/(2*D*t))
    end

function GillespieFT(L, N, D)
    M=2*N
    Nx = 201
    dx = 2.0*L/(Nx-1)
    X = dx*(-(Nx-1)/2:(Nx-1)/2)
    Y = zeros(Int64,N)
    Dmat = randexp(N)
    Dmat3 = [Dmat; Dmat]
    rates = (Dmat3/2)*(1/(dx*dx))
    t=0.0

    totalRate2 = sum(rates)
    dt = 1.0/totalRate2
    T=1

    q3treevalues = Array{KVPair}(M)

    for i in 1:M
        q3treevalues[i] = KVPair(i,rates[i])
    end

    q3T = Nullable{FTree}(FTree(KVPair(0,0.0)))
    q3T = buildFTree(q3T, q3treevalues)

# This is the main loop
    while t < T
        # Pick an event
        a = Float64(rand(Uniform(0,totalRate2)))
        k = FenSearch(q3T, a).key
        if k<=N
            hop = 1
            particleId = k
        else
            hop = -1
            particleId=k-N
        end
        Y[particleId]+=hop
        t+=dt
    end
    # Calculate the estimated density of particles
    Ptree =zeros(Float64,length(X))
    for i in 1:length(Y)
        Ptree[Y[i]+Int64((Nx-1)/2)+1]+=1/(N * dx)
    end
    PanT = analysol.(X, D, T)
    return Ptree, PanT, X
end

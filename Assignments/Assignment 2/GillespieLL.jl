function GillespieLL(L, N, D)
    M=2*N
    Nx = 201
    dx = 2.0*L/(Nx-1)
    X = dx.*(-(Nx-1)/2:(Nx-1)/2)
    Y =zeros(Int64,N)
    Dmat = randexp(N)
    Dmat2 = [Dmat; Dmat]
    rates = (Dmat2/2)*(1/(dx*dx))
    t=0.0
    totalRate = sum(rates)
    dt = 1.0/(totalRate)
    T=1

    q3listvalues = zeros(M)

    cumrate = cumsum(rates)

    q3listvalues = Array{KVPair}(M)

    for i in 1:M
        q3listvalues[i] = KVPair(i,cumrate[i])
    end


    q3L = Nullable{LList}()
    q3L = buildLList(q3listvalues)


    #This is the main loop
    while t < T
        # Pick an event
        a = Float64(rand(Uniform(0,totalRate)))
        k = q2search(q3L, a).key
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
    P = zeros(Float64,length(X))

    for i in 1:length(Y)
        P[Y[i]+Int64((Nx-1)/2)+1]+=1/(N * dx)
    end
    P2 = analysol.(X, D, T)
    return P, P2, X
end

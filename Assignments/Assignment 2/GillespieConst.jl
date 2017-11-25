function GillespieConst(L, N, D)
    #This function simulates the
    #L= Length of domain
    #N = Number of Particles
    #D = Diffusion coefficient (equal for all particles)

    Nx = 501
    dx = 2.0*L/(Nx-1)
    X = dx*(-(Nx-1)/2:(Nx-1)/2)
    Y = zeros(Int64,N)
    t = 0.0
    r = (D/2.0)/(dx*dx)
    totalRate = 2.0*N*r
    dt = 1.0/totalRate
    T=1.0

    # This is the main loop
    while t < T
        # Pick an event
        k = rand(1:2*N)
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

    P1 = normal.(X, D, T)
    return P, P1, X
end

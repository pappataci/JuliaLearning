using LinearAlgebra, StatsBase

# Transition probability matrix
P = [ 0.5 0.4 0.1 ;
      0.3 0.2 0.5 ;
      0.5 0.3 0.2]  

# Evaluating SteadyState Probabilities
# Method 1: lim P ^ n for n -> infinity

piProbl = (P^100)[1,:]

# Solving the equivalent linear system
A = vcat( (P' - I)[1:2,:] , ones(1,3) )
b = [0 0 1]'
piProb2 = A\b

# Third way using the Perron Frobenius theorem
eigVecs = eigvecs( copy(P') )
highestVec = eigVecs[ : , findmax(abs.(eigvals(P)))[2]]
piProb3 = Array{Float64}(highestVec)/norm(highestVec,1)

# MonteCarlo Method
function computeSteadyStateMC(P , numberOfSims = 10^6)
    numOfStates = size(P)[2]
    numInState = zeros(Int,numOfStates )
    state = 1 # init at initial state

    for t in 1:numberOfSims
        numInState[state] += 1
        state = sample(1:numOfStates , weights(P[state,:])) 
    end
    
    return numInState/ numberOfSims 
end

piProb4 = computeSteadyStateMC(P)
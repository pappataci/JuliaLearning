using Statistics

@time begin
    data = [mean(rand(5*10^2)) for _ in 1:10^6]
    println("98% of the means lie in the estimated range: ",
                       (quantile(data,0.01),quantile(data,0.99)) )
end

@time begin # experimenting
    data2 = rand(5*10^2, 10^6)
    means = mean(data2, dims = 1 )
    means = reshape(means, (10^6, ))
    println("98% of the means lie in the estimated range: ",
                       (quantile(means,0.01),quantile(means,0.99)))
end
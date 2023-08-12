println("There is more than one way to say hello:")

helloArray = ["Hello" , "G'day", "Shalom"]

for i in 1:3
    println("\t" , helloArray[i] , " Wordld!")
end

println("\nThese squares are just perfect:")

squares = [i^2 for i in 0:10]

for s in squares
    print("  " , s ,"\n")
end

println("\nTesting sqrt function applied to a list \n")

sqrt.(squares)
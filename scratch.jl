a = 3.0

function closure()
    return a
end

b = closure()

a = 4.0

c = closure()

println(" c " , c , "b ", b)

function test(current_value)
    function innerFunct()
        println(current_value)
    end
    return innerFunct
end

a = test(2.0)
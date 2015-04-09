# perfect_numbers.nim
# caclulate perfect numbers
#
# vim: ft=nim sw=4 ts=4 et
#

# predicate to check whether a number is perfect
proc isperfect* (n : int) : bool =
    var sum = 0
    for i in 1 .. <n:
        if (n mod i) == 0:
            sum += i
        #echo("i: ", i, "\tsum: ", sum)
    
    return (sum == n)

# collect all perfect numbers up to given limit
proc perfect_numbers* (n : int) : seq[int] =
    result = @[]
    for i in 1 .. n:
        if isperfect(i): add(result, i)




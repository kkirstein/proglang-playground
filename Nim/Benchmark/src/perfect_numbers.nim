# perfect_numbers.nim
# caclulate perfect numbers
#
# vim: ft=nim sw=2 ts=2 et
#

# predicate to check whether a number is perfect
proc isperfect* (n : int) : bool =
  var sum = 0
  for i in 1 .. <n:
    if (n mod i) == 0:
        sum += i

  return (sum == n)

# collect all perfect numbers up to given limit
proc perfect_numbers* (n : int) : seq[int] =
  result = @[]
  for i in 1 .. n:
    if isperfect(i): add(result, i)



# alternative tail-recursive implementation
proc loop_2 (n, i, sum : int) : bool =
  if i==n:
    result = (sum == n)
  elif (n mod i) == 0:
    result = loop_2(n, i+1, sum+i)
  else:
    result = loop_2(n, i+1, sum)

proc isperfect_2* (n : int) : bool =
  result = loop_2(n, 1, 0)

proc perfect_numbers_2* (n : int) : seq[int] =
  result = @[]
  for i in 1 .. n:
    if isperfect_2(i): add(result, i)



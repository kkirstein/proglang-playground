// Calculate perfect numbers in F#

namespace Tasks

module Perfectnumber =

    // predicate to check whether a number is perfect
    let isPerfect n =
        let rec loop i sum =
            if n = i then
                sum = n
            else if n % i = 0 then
                loop (i + 1) (sum + i)
            else
                loop (i + 1) sum

        if n > 0 then
            loop 1 0
        else
            failwith "n must > 0"


    // generate a list of perfect numbers until given limit
    let perfectNumbers n =
        let rec loop i =
            if i = n then
                []
            else if isPerfect i then
                i :: loop (i + 1)
            else
                loop (i + 1)

        loop 1

    let rec range start stop =
        if start < stop then
            start :: (range (start + 1) stop)
        else
            []


    // async variant of perfect number generation
    let isPerfectAsync n = async { return isPerfect n, n }

    let perfectNumbersAsync n =
        range 1 n
        |> Seq.map isPerfectAsync
        |> Async.Parallel
        |> Async.RunSynchronously
        |> Seq.filter fst
        |> Seq.map snd
        |> Seq.toList

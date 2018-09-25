// Calculate perfect numbers in F#

namespace Tasks

open FSharp.Collections.ParallelSeq

module Perfectnumber =

    // predicate to check whether a number is perfect
    let isPerfect n =
        let rec loop i sum =
            if n = i then sum = n else
            if n % i = 0 then loop (i + 1) (sum + i) else loop (i + 1) sum
        in
        if n > 0 then loop 1 0 else failwith "n must > 0"

    // generate a list of perfect numbers until given limit
    let perfectNumbers n =
        let rec loop i =
            if i = n then []
            else
                if isPerfect i then i :: loop (i + 1) else loop (i + 1)
        in
        loop 1

    let rec range start stop =
        if start < stop then start :: (range (start + 1) stop) else []

    // generate a list of perfect numbers by an iterator
    let perfectNumbers2 n =
        let r = range 1 n in
        PSeq.filter isPerfect r |> PSeq.toList

// Calculate perfect numbers in F#

namespace Tasks

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

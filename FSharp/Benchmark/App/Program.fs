// Learn more about F# at http://fsharp.org

open System
open Tasks.Fibonacci

[<EntryPoint>]
let main argv =
    printfn "F# Benchmarks"
    printfn "============="
    printfn ""
    printfn "Fibonacci numbers"
    printfn "-----------------"
    printfn "fib_naive(35): %d" (fib_naive 35)
    printfn "fib(35): %d" (fib 35)
    printfn ""
    printfn "-----"
    printfn "Done!"
    0 // return an integer exit code

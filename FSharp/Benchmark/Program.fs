// Learn more about F# at http://fsharp.org

open System
open Tasks.Fibonacci

[<EntryPoint>]
let main argv =
    printfn "fib_naive(35): %d" (fib_naive 35)
    printfn "Hello World from F#!"
    0 // return an integer exit code

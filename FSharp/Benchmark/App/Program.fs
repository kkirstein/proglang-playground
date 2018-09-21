// Learn more about F# at http://fsharp.org

open System
open Tasks.Fibonacci
open Tasks.Perfectnumber

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
    printfn "Perfect numbers"
    printfn "---------------"
    (* printfn "perfect_numbers(1000): %s"
        (List.map to_string (perfect_numbers 1000) |> String.concat ",") *)
    printfn ""
    printfn "-----"
    printfn "Done!"
    0 // return an integer exit code

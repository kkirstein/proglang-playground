// Learn more about F# at http://fsharp.org

open System.Diagnostics
open Tasks.Fibonacci
open Tasks.Perfectnumber

// measures the elapsed tim eof the given function
let time_it f =
    let timer = new Stopwatch () in
    timer.Start ()
    let res = f ()
    timer.Stop ()
    (res, timer.ElapsedMilliseconds)

[<EntryPoint>]
let main argv =
    printfn "F# Benchmarks"
    printfn "============="
    printfn ""
    printfn "Fibonacci numbers"
    printfn "-----------------"
    let res, elap = time_it (fun () -> fibNaive 35) in
    printfn "fibNaive(35): %d (%d ms)" res elap
    let res, elap = time_it (fun () -> fib 35) in
    printfn "fib(35): %A (%d ms)" res elap
    let res, elap = time_it (fun () -> fib 1000) in
    printfn "fib(1000): %A (%d ms)" res elap
    printfn ""
    printfn "Perfect numbers"
    printfn "---------------"
    let res, elap = time_it (fun () -> perfectNumbers 10000) in
    printfn "perfect_numbers(10000): %A (%d ms)" res elap
    printfn ""
    printfn "-----"
    printfn "Done!"
    0 // return an integer exit code

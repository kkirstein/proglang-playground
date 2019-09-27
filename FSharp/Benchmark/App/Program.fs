// Learn more about F# at http://fsharp.org


open System.Diagnostics
open Tasks.Fibonacci
open Tasks.Perfectnumber
open Tasks.Mandelbrot

// measures the elapsed tim eof the given function
let timeIt f =
    let timer = Stopwatch () in
    timer.Start ()
    let res = f ()
    timer.Stop ()
    (res, timer.ElapsedMilliseconds)

[<EntryPoint>]
let main _argv =
    printfn "F# Benchmarks"
    printfn "============="
    printfn ""
    printfn "Fibonacci numbers"
    printfn "-----------------"
    let res, elap = timeIt (fun () -> fibNaive 35) in
    printfn "fibNaive(35): %d (%d ms)" res elap
    let res, elap = timeIt (fun () -> fib 35) in
    printfn "fib(35): %A (%d ms)" res elap
    let res, elap = timeIt (fun () -> fib 1000) in
    printfn "fib(1000): %A (%d ms)" res elap
    printfn ""
    printfn "Perfect numbers"
    printfn "---------------"
    let res, elap = timeIt (fun () -> perfectNumbers 10000) in
    printfn "perfectNumbers(10000): %A (%d ms)" res elap
    let res, elap = timeIt (fun () -> perfectNumbersAsync 10000) in
    printfn "perfectNumbersAsync(10000): %A (%d ms)" res elap
    printfn ""
    printfn "Mandelbrot set"
    printfn "--------------"
    let res, elap = timeIt (fun () -> mandelbrot 1920 1200 -0.5 0.0 (4.0/1920.0)) in
    printfn "mandelbrot(1920 x 1200): done (%d ms)" elap
    let res, elap = timeIt (fun () -> writePNM res @"./mandelbrot.pnm") in
    printfn "mandelbrot(1920 x 1200): written (%d ms)" elap
    printfn "-----"
    printfn "Done!"
    0 // return an integer exit code

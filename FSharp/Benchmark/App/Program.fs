// Learn more about F# at http://fsharp.org

open System.Diagnostics
open Tasks.Fibonacci
open Tasks.Perfectnumber
open Tasks.Mandelbrot

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
    printfn "perfectNumbers(10000): %A (%d ms)" res elap
    let res, elap = time_it (fun () -> perfectNumbersPar 10000) in
    printfn "perfectNumbers2(10000): %A (%d ms)" res elap
    printfn ""
    printfn "Mandelbrot set"
    printfn "--------------"
    let res, elap = time_it (fun () -> mandelbrot 1920 1200 -0.5 0.0 (4.0/1920.0)) in
    printfn "mandelbrot(1920 x 1200): done (%d ms)" elap
    let res, elap = time_it (fun () -> writePNM res @"./mandelbrot.pnm") in
    printfn "mandelbrot(1920 x 1200): written (%d ms)" elap
    printfn "-----"
    printfn "Done!"
    0 // return an integer exit code

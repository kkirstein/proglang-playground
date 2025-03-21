// Calculate Mandelbrot set F#

namespace Tasks

open System.Numerics
open FSharp.Collections.ParallelSeq

// open FSharp.Collections.ParallelSeq

module Mandelbrot =
    // some constants
    let rMax = 2.0
    let nMax = 255

    // generate pixel value
    let pixelValue x y =
        let z0 = Complex (x, y) in
        let rec loop z n =
            if Complex.Abs z > rMax || n = 0 then n
            else loop (z * z + z0) (n - 1)
        in
        loop Complex.Zero nMax

    // convert pixel value to RGB
    let toRgb n =
        let r, g, b = 5 * (n % 15), 32 * (n % 7), 8 * (n % 31) in
        (r, g, b)
    let toRgbAsync n =
        async {
            let r, g, b = 5 * (n % 15), 32 * (n % 7), 8 * (n % 31) in
            return (r, g, b)
        }

    // convert linear index to image coordinates
    let idxToCoord i width _height xOffset yOffset pixelSize =
        let xVal = (float (i % width)) * pixelSize + xOffset
        let yVal = (float (i / width)) * pixelSize - yOffset
        xVal, yVal

    // calculate Mandelbrot set
    type Image = {
        width: int
        height: int
        data: (int * int * int)[]
    }

    // Pseq variant
    let mandelbrotPSeq width height xCenter yCenter pixelSize =
        let xOffset = xCenter - 0.5 * pixelSize * (float width)
        let yOffset = yCenter + 0.5 * pixelSize * (float height)
        let data = PSeq.init (width * height) (fun i -> 
            let xVal = (float (i % width)) * pixelSize + xOffset
            let yVal = (float (i / width)) * pixelSize - yOffset
            (pixelValue xVal yVal) |> toRgb)
        {width = width; height = height; data = PSeq.toArray data}

    // array variant
    let mandelbrotAry width height xCenter yCenter pixelSize =
        let xOffset = xCenter - 0.5 * pixelSize * (float width)
        let yOffset = yCenter + 0.5 * pixelSize * (float height)
        let data = Array.init (width * height) (fun i -> 
            let xVal = (float (i % width)) * pixelSize + xOffset
            let yVal = (float (i / width)) * pixelSize - yOffset
            (pixelValue xVal yVal) |> toRgb)
        {width = width; height = height; data = data}

    // async variant of Mandelbrot set
    let pixelRgbAsync (x, y) =
        async {
            return pixelValue x y |> toRgb
        }

    let mandelbrotAsync width height xCenter yCenter pixelSize =
        let xOffset = xCenter - 0.5 * pixelSize * (float width)
        let yOffset = yCenter + 0.5 * pixelSize * (float height)
        seq {0 .. (width * height)}
        |> Seq.map ((fun i -> idxToCoord i width height xOffset yOffset pixelSize) >> pixelRgbAsync)
        |> Async.Parallel
        |> Async.RunSynchronously
        |> fun data-> {width = width; height = height; data = data}
            

    // write bitmap array as PNM image
    let writePNM img filePath =
        use fid = System.IO.File.CreateText filePath
        fid.Write (sprintf "P3\n%d %d %d\n" img.width img.height nMax)
        Array.iter (fun (r, g, b) -> fid.WriteLine (sprintf "%d %d %d" r g b)) img.data

    // write bitmap array as PNM image (async variant)
    let writePNMAsync img filePath =
        async {
            use fid = System.IO.File.CreateText filePath
            fid.Write (sprintf "P3\n%d %d %d\n" img.width img.height nMax)
            Array.iter (fun (r, g, b) -> fid.WriteLine (sprintf "%d %d %d" r g b)) img.data
        }
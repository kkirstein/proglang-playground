(* vim: set ft=ocaml sw=2 ts=2: *)

(* mandelbrot.ml
 * A package to Mandelbrot sets
 *)

(* struct for pixel color *)
type pixel_color = { r : int; g : int; b : int }

(* image data container *)
type image = { width : int; height : int; data : pixel_color array }


(* calculate pixel value *)
let pixel_value x y n_max r_max =
  let z0 = {Complex.re = x; Complex.im = y} in
  let rec loop z n =
    if (Complex.norm z > r_max) || (n = 0) then n
    else loop (Complex.add (Complex.mul z z) z0) (n-1)
  in
  loop Complex.zero n_max
;;

(* select color for given pixel value *)
let color_black = { r = 0; g = 0; b = 0 }
let color_white = { r = 255; g = 255; b = 255 }
let color_of_value value = 
  if value > 0 then color_white else color_black
;;

(* generate image data *)
let image ?color:(color=color_black) width height = 
  { width=width; height=height; data=Array.make (width*height) color }
;;

let pixel_iter f img =
  let rec loop x y =
    if x < (img.width-1) then (ignore(f x y img); loop (x+1) y)
    else (if y < (img.height-1) then (ignore(f x y img); loop 0 (y+1))
      else ())
  in
  loop 0 0
;;


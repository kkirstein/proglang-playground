(* vim: set ft=ocaml sw=2 ts=2: *)

(* image.mli
 * A package for image data containers
 *)

(* struct for pixel color *)
type pixel_color = { r : int; g : int; b : int }

let color_black = { r = 0; g = 0; b = 0 }
let color_white = { r = 255; g = 255; b = 255 }

(* image data container *)
type image = { width : int; height : int; data : pixel_color array }

(* generate image data *)
let make ?color:(color=color_black) width height = 
  { width=width; height=height; data=Array.make (width*height) color }
;;


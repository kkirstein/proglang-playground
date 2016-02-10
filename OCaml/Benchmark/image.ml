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

(* set pixel color *)
let set_color img x y color =
  if (x > (img.width - 1)) || (y > (img.height - 1)) then
    raise (Invalid_argument "Index out of bound")
  else
    Array.set img.data (x + y*img.width) color
;;

(* map function to all pixels *)
let map f img =
  let rec loop x y =
    if x < (img.width-1) then (ignore(f x y |> set_color img x y); loop (x+1) y)
    else (if y < (img.height-1) then (ignore(f x y |> set_color img x y); loop 0 (y+1))
      else img)
  in
  loop 0 0
;;


(* write image to pnm file *)
let write_ppm img file_name =
  let oc = open_out file_name in
  try
    Printf.fprintf oc "P3\n";
    Printf.fprintf oc "%d %d %d\n" img.width img.height 255;
    Array.iter (fun p -> Printf.fprintf oc "%d %d %d\n" p.r p.g p.b) img.data;
    close_out oc
  with e ->
    close_out_noerr oc;
    raise e
;;


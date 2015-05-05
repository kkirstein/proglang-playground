// hello.dats
// Hello World in ATS
//
// vim: ft=ats

(* ****** ****** *)
//
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
//
(* ****** ****** *)

val _ = print ("Hello World!\n")

// some bindings
val radius = 10.0
val area = let val PI = 3.14 and radius2 = radius * radius in PI * radius2
end // end of [let]

val _ = println! ("Radius: ", radius)
val _ = println! ("Area: ", area)

// Error single binding must be independent:
//val x = 0 and y = x + 1

// using some tuple types
val xyz = ('A', 1, 2.0)
val x1 = xyz.0 and y1 = xyz.1 and z1 = xyz.2
//pattern matching
val (x2, y2, z2) = xyz

val _ = println! ("x: ", x1, "/", x2)
val _ = println! ("y: ", y1, "/", y2)
val _ = println! ("z: ", z1, "/", z2)

implement main0 () = () // a dummy for [main]


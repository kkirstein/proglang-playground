#!/usr/bin/env ocaml
(* plot_1d_time_steps.ml *)
(**
    Reads output of tsunami app (chapter 2) and plots the
    resulting blob position in an image file; one image file
    per time step. *)

#use "topfind"
#require "str"

let input_file = "./data_1d_time_steps.txt"

let generate_plot data_str =
  match Str.split (Str.regexp "[ ]+") data_str with
  | time :: data -> print_endline ("time: " ^ time)
  | _            -> failwith "Invalid data"

let () =
  if not (Sys.file_exists input_file) then
    print_endline ("Could not find " ^ input_file)
  else ();
  let ic = open_in input_file in
  try
    while true do
      let ll = input_line ic in
      generate_plot ll
    done
  with
  | End_of_file -> close_in ic
  | err -> close_in_noerr ic; raise err

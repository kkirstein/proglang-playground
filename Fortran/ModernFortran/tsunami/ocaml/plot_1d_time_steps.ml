#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "str"
#require "archimedes"
#require "archimedes.cairo"

(** plot_1d_time_steps.ml
    Reads output of tsunami app (chapter 2) and plots the
    resulting blob position in an image file; one image file
    per time step. *)

module A = Archimedes

let input_file = "./data/1d_time_steps.txt"

let generate_plot data_str =
  match Str.split (Str.regexp "[ ]+") data_str with
  | time :: data -> begin
      let file_name = Printf.sprintf "./data/plot_1d_time_%04d.png" (int_of_string time) in
      let vp = A.init ["Cairo"; "PNG"; file_name]
      in
      A.Axes.box vp;
      A.List.y vp ~style:`Lines (List.map float_of_string data);
      A.close vp
    end
  | _            -> failwith "Invalid data"

let () =
  if not (Sys.file_exists input_file) then
    failwith ("Could not find " ^ input_file)
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

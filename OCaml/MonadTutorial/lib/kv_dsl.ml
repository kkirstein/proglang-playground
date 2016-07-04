(** A Ocaml tutorial to show the usage of Monads
 * It implements a DSL for a key-value store, using
 * different backend implementation, e.g. Hashtbl or Assoc Lists
 *
 * This module implements a DSL for the KV-store
 *
 * see: http://www.heise.de/developer/artikel/Dependency-Injection-in-der-funktionalen-Programmierung-3115570.html
 *)


(* the actions *)
type t =
  | Put of key * value
  | Get of key

//##// Contest ID: abc259
//##// Problem ID: abc259_a ( https://atcoder.jp/contests/abc259/tasks/abc259_a )
//##// Title: A. Growth Record
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-07-10 07:17:42 +0000 UTC ( https://atcoder.jp/contests/abc259/submissions/33142529 ) 

open Core
open Printf

(* open Num *)
(* open IterLabels *)

let id x = x
let si _ = Scanf.scanf " %d" id
let si2 _ = Scanf.scanf " %d %d" (fun x y -> x, y)
let si3 _ = Scanf.scanf " %d %d %d" (fun x y z -> x, y, z)
let sc _ = Scanf.scanf " %c" id
let ss _ = Scanf.scanf " %s" id
let pi d = printf "%d\n" d
let pi2 a b = printf "%d %d\n" a b
let ps s = printf "%s\n" s
let pf f = printf "%0.6f\n" f

open List

let ( -- ) s e = init (e - s + 1) ~f:(fun x -> s + x)
let ( >|| ) x f = iter ~f x
let sort_int = sort ~compare:Int.compare

let option_exn = function
  | Some x -> x
  | None -> assert false
;;

let option_either l ~f =
  List.fold l ~init:None ~f:(fun acc x ->
      match acc with
      | None -> f x
      | Some x -> Some x)
;;

(************)
let nn = si ()
let mm = si ()
let xx = si ()
let tt = si ()
let dd = si ()
let () = if mm >= xx then pi tt else tt - (dd * (xx - mm)) |> pi

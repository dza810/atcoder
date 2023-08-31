//##// Contest ID: abc256
//##// Problem ID: abc256_a ( https://atcoder.jp/contests/abc256/tasks/abc256_a )
//##// Title: A. 2^N
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-19 02:03:07 +0000 UTC ( https://atcoder.jp/contests/abc256/submissions/32581538 ) 

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

let () = Int.(1 lsl nn) |> pi
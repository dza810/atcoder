//##// Contest ID: abc257
//##// Problem ID: abc257_a ( https://atcoder.jp/contests/abc257/tasks/abc257_a )
//##// Title: A. A to Z String 2
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-25 12:08:32 +0000 UTC ( https://atcoder.jp/contests/abc257/submissions/32714473 ) 

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
let pc s = printf "%c\n" s
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
let nn, xx = si2 ()

let () =
  (xx - 1) / nn + (Char.to_int 'A' ) |> Char.of_int |> option_exn |> pc
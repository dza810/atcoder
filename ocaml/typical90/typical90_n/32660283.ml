//##// Contest ID: typical90
//##// Problem ID: typical90_n ( https://atcoder.jp/contests/typical90/tasks/typical90_n )
//##// Title: 014. We Used to Sing a Song Together（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-22 12:54:32 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32660283 ) 

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
let aa = 1 -- nn >>| si |> sort_int
let bb = 1 -- nn >>| si |> sort_int

let () =
  zip_exn aa bb |> fold ~init:0 ~f:(fun acc (a, b) -> acc + Int.abs (a - b)) |> pi
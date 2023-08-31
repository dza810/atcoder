//##// Contest ID: typical90
//##// Problem ID: typical90_v ( https://atcoder.jp/contests/typical90/tasks/typical90_v )
//##// Title: 022. Cubic Cake（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-28 13:19:02 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32818872 ) 

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
let a, b, c = si3 ()
let rec gcd a b = if a < b then gcd b a else if b = 0 then a else gcd b (a mod b)

let () =
  let x = gcd a b in
  let x = gcd c x in
  pi ((a / x) - 1 + ((b / x) - 1) + ((c / x) - 1))
;;

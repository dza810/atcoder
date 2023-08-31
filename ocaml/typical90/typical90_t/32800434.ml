//##// Contest ID: typical90
//##// Problem ID: typical90_t ( https://atcoder.jp/contests/typical90/tasks/typical90_t )
//##// Title: 020. Log Inequality（★3）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-27 13:13:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32800434 ) 

open Core
open Printf

open Num
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
let a = ss () |> num_of_string
let b = si ()
let c = si ()
let b = num_of_int b
let c = num_of_int c

let () =
  ps @@ if power_num c b >/ a then "Yes" else "No"
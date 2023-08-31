//##// Contest ID: typical90
//##// Problem ID: typical90_x ( https://atcoder.jp/contests/typical90/tasks/typical90_x )
//##// Title: 024. Select +／- One（★2）
//##// Language: OCaml (4.10.0)
//##// Submitted: 2022-06-30 14:20:19 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/32853968 ) 

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

(************)
let nn, kk = si2 ()

let aa = 1 -- nn >>| si
let bb = 1 -- nn >>| si

let () =
  let c = fold2_exn aa bb ~init:kk ~f:(fun acc a b ->
    acc - Int.abs (a - b)
    )
  in
  ps @@ if c >= 0 && c mod 2 = 0 then "Yes" else "No"